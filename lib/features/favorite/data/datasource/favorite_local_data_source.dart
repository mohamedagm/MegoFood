import 'package:hive_ce/hive.dart';
import 'package:mego_food/core/storage/hive_storage_service.dart';
import 'package:mego_food/features/favorite/data/models/favorite_item_model.dart';

class FavoriteStorageKeys {
  static const favoriteBox = 'favoriteBox';
}

class FavoriteLocalDataSource {
  final HiveStorageService _storageService;
  Box<FavoriteItemModel>? _box;

  FavoriteLocalDataSource(this._storageService);

  Future<Box<FavoriteItemModel>> get box async {
    _box ??= await _storageService.openBox<FavoriteItemModel>(
      FavoriteStorageKeys.favoriteBox,
    );
    return _box!;
  }

  Future<List<FavoriteItemModel>> getItems() async {
    final b = await box;
    return b.values.toList();
  }

  Future<FavoriteItemModel?> getItem(String productId) async {
    final b = await box;
    return b.get(productId);
  }

  Future<void> upsertItem(FavoriteItemModel item) async {
    final b = await box;
    await b.put(item.productId, item);
  }

  Future<void> deleteItem(String productId) async {
    final b = await box;
    await b.delete(productId);
  }
}
