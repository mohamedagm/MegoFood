import 'package:hive_ce/hive.dart';
import 'package:mego_food/core/storage/hive_storage_service.dart';
import 'package:mego_food/features/cart/data/models/cart_item_model.dart';

class CartStorageKeys {
  static const cartBox = 'cartBox';
}

class CartLocalDataSource {
  final HiveStorageService _storageService;
  Box<CartItemModel>? _box;

  CartLocalDataSource(this._storageService);

  Future<Box<CartItemModel>> get box async {
    _box ??= await _storageService.openBox<CartItemModel>(CartStorageKeys.cartBox);
    return _box!;
  }

  Future<List<CartItemModel>> getItems() async {
    final b = await box;
    return b.values.toList();
  }

  Future<void> upsertItem(CartItemModel item) async {
    final b = await box;
    await b.put(item.productId, item);
  }

  Future<void> deleteItem(String productId) async {
    final b = await box;
    await b.delete(productId);
  }

  Future<void> clear() async {
    final b = await box;
    await b.clear();
  }
}
