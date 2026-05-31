import 'package:equatable/equatable.dart';
import 'package:mego_food/features/cart/data/models/cart_item_model.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object?> get props => [];
}

final class CartInitial extends CartState {
  const CartInitial();
}

final class CartLoading extends CartState {
  const CartLoading();
}

final class CartLoaded extends CartState {
  final List<CartItemModel> items;

  const CartLoaded(this.items);

  double get total =>
      items.fold(0.0, (sum, item) => sum + item.unitPrice * item.quantity);

  int get totalQuantity => items.fold(0, (sum, item) => sum + item.quantity);

  @override
  List<Object?> get props => [items];
}

final class CartFailure extends CartState {
  final String message;

  const CartFailure(this.message);

  @override
  List<Object?> get props => [message];
}

final class CartRestaurantConflict extends CartState {
  final List<CartItemModel> items;
  final CartItemModel pendingItem;

  const CartRestaurantConflict(this.items, this.pendingItem);

  double get total =>
      items.fold(0.0, (sum, item) => sum + item.unitPrice * item.quantity);

  int get totalQuantity => items.fold(0, (sum, item) => sum + item.quantity);

  @override
  List<Object?> get props => [items, pendingItem];
}
