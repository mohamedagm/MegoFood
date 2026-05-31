import 'package:mego_food/features/favorite/data/models/favorite_item_model.dart';

abstract class FavoriteRepo {
  Future<List<FavoriteItemModel>> getItems();
  Future<bool> isFavorite(String productId);
  Future<List<FavoriteItemModel>> addItem(FavoriteItemModel item);
  Future<List<FavoriteItemModel>> removeItem(String productId);
  Future<List<FavoriteItemModel>> toggleItem(FavoriteItemModel item);
}
