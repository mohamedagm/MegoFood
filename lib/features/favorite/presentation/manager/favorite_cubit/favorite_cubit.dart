import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mego_food/features/favorite/data/models/favorite_item_model.dart';
import 'package:mego_food/features/favorite/data/repo/favorite_repo.dart';
import 'package:mego_food/features/favorite/presentation/manager/favorite_cubit/favorite_state.dart';
import 'package:mego_food/features/home/data/model/product_model.dart';

enum FavoriteToggleResult { added, removed, failure }

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepo _favoriteRepo;

  FavoriteCubit(this._favoriteRepo) : super(const FavoriteInitial());

  Future<void> loadFavorites() async {
    emit(const FavoriteLoading());
    try {
      final items = await _favoriteRepo.getItems();
      emit(FavoriteLoaded(items));
    } catch (e) {
      emit(FavoriteFailure(e.toString()));
    }
  }

  bool isFavorite(String productId) {
    final currentState = state;
    if (currentState is! FavoriteLoaded) return false;
    return currentState.isFavorite(productId);
  }

  Future<FavoriteToggleResult> toggleProduct(ProductModel product) async {
    try {
      final wasFavorite = isFavorite(product.id);
      final favoriteItem = FavoriteItemModel.fromProduct(product);
      final items = await _favoriteRepo.toggleItem(favoriteItem);
      emit(FavoriteLoaded(items));
      return wasFavorite
          ? FavoriteToggleResult.removed
          : FavoriteToggleResult.added;
    } catch (e) {
      emit(FavoriteFailure(e.toString()));
      return FavoriteToggleResult.failure;
    }
  }

  Future<void> removeItem(String productId) async {
    try {
      final items = await _favoriteRepo.removeItem(productId);
      emit(FavoriteLoaded(items));
    } catch (e) {
      emit(FavoriteFailure(e.toString()));
    }
  }
}
