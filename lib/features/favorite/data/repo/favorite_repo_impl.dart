import 'package:mego_food/features/favorite/data/datasource/favorite_local_data_source.dart';
import 'package:mego_food/features/favorite/data/models/favorite_item_model.dart';
import 'package:mego_food/features/favorite/data/repo/favorite_repo.dart';

class FavoriteRepoImpl implements FavoriteRepo {
  final FavoriteLocalDataSource _dataSource;

  FavoriteRepoImpl(this._dataSource);

  @override
  Future<List<FavoriteItemModel>> getItems() => _dataSource.getItems();

  @override
  Future<bool> isFavorite(String productId) async {
    final item = await _dataSource.getItem(productId);
    return item != null;
  }

  @override
  Future<List<FavoriteItemModel>> addItem(FavoriteItemModel item) async {
    await _dataSource.upsertItem(item);
    return _dataSource.getItems();
  }

  @override
  Future<List<FavoriteItemModel>> removeItem(String productId) async {
    await _dataSource.deleteItem(productId);
    return _dataSource.getItems();
  }

  @override
  Future<List<FavoriteItemModel>> toggleItem(FavoriteItemModel item) async {
    final isCurrentlyFavorite = await isFavorite(item.productId);
    if (isCurrentlyFavorite) {
      return removeItem(item.productId);
    }
    return addItem(item);
  }
}
