import 'package:mego_food/features/cart/data/datasource/cart_local_data_source.dart';
import 'package:mego_food/features/cart/data/models/cart_item_model.dart';
import 'package:mego_food/features/cart/data/repo/cart_repo.dart';

class CartRepoImpl implements CartRepo {
  final CartLocalDataSource _dataSource;

  CartRepoImpl(this._dataSource);

  @override
  Future<List<CartItemModel>> getItems() => _dataSource.getItems();

  @override
  Future<CartOperationResult> addItem(CartItemModel item) async {
    final items = await _dataSource.getItems();

    if (items.isNotEmpty) {
      final existingRestaurantId = items.first.restaurantId;
      final newRestaurantId = item.restaurantId;

      if (existingRestaurantId != null &&
          newRestaurantId != null &&
          existingRestaurantId != newRestaurantId) {
        return CartOperationResult(
          status: CartOperationStatus.restaurantConflict,
          items: items,
          pendingItem: item,
        );
      }

      final existingIndex = items.indexWhere(
        (i) => i.productId == item.productId,
      );
      if (existingIndex != -1) {
        final updated = items[existingIndex].copyWith(
          quantity: items[existingIndex].quantity + item.quantity,
        );
        await _dataSource.upsertItem(updated);
        final updatedItems = await _dataSource.getItems();
        return CartOperationResult(
          status: CartOperationStatus.success,
          items: updatedItems,
        );
      }
    }

    await _dataSource.upsertItem(item);
    final updatedItems = await _dataSource.getItems();
    return CartOperationResult(
      status: CartOperationStatus.success,
      items: updatedItems,
    );
  }

  @override
  Future<List<CartItemModel>> increment(String productId) async {
    final items = await _dataSource.getItems();
    final index = items.indexWhere((i) => i.productId == productId);
    if (index != -1) {
      final updated = items[index].copyWith(quantity: items[index].quantity + 1);
      await _dataSource.upsertItem(updated);
    }
    return _dataSource.getItems();
  }

  @override
  Future<List<CartItemModel>> decrementOrRemove(String productId) async {
    final items = await _dataSource.getItems();
    final index = items.indexWhere((i) => i.productId == productId);
    if (index != -1) {
      if (items[index].quantity <= 1) {
        await _dataSource.deleteItem(productId);
      } else {
        final updated = items[index].copyWith(
          quantity: items[index].quantity - 1,
        );
        await _dataSource.upsertItem(updated);
      }
    }
    return _dataSource.getItems();
  }

  @override
  Future<List<CartItemModel>> removeItem(String productId) async {
    await _dataSource.deleteItem(productId);
    return _dataSource.getItems();
  }

  @override
  Future<List<CartItemModel>> clearCart() async {
    await _dataSource.clear();
    return [];
  }
}
