import 'package:equatable/equatable.dart';
import 'package:mego_food/features/favorite/data/models/favorite_item_model.dart';

sealed class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object?> get props => [];
}

final class FavoriteInitial extends FavoriteState {
  const FavoriteInitial();
}

final class FavoriteLoading extends FavoriteState {
  const FavoriteLoading();
}

final class FavoriteLoaded extends FavoriteState {
  final List<FavoriteItemModel> items;

  const FavoriteLoaded(this.items);

  bool isFavorite(String productId) {
    return items.any((item) => item.productId == productId);
  }

  @override
  List<Object?> get props => [items];
}

final class FavoriteFailure extends FavoriteState {
  final String message;

  const FavoriteFailure(this.message);

  @override
  List<Object?> get props => [message];
}
