import 'package:mego_food/features/cart/data/models/cart_item_model.dart';

enum CartOperationStatus { success, restaurantConflict }

class CartOperationResult {
  final CartOperationStatus status;
  final List<CartItemModel> items;
  final CartItemModel? pendingItem;

  const CartOperationResult({
    required this.status,
    required this.items,
    this.pendingItem,
  });
}

abstract class CartRepo {
  Future<List<CartItemModel>> getItems();
  Future<CartOperationResult> addItem(CartItemModel item);
  Future<List<CartItemModel>> increment(String productId);
  Future<List<CartItemModel>> decrementOrRemove(String productId);
  Future<List<CartItemModel>> removeItem(String productId);
  Future<List<CartItemModel>> clearCart();
}
