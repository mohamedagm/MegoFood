import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mego_food/features/cart/data/models/cart_item_model.dart';
import 'package:mego_food/features/cart/data/repo/cart_repo.dart';
import 'package:mego_food/features/cart/presentation/manager/cart_cubit/cart_state.dart';

enum AddToCartResult { success, restaurantConflict, failure }

class CartCubit extends Cubit<CartState> {
  final CartRepo _cartRepo;

  CartCubit(this._cartRepo) : super(const CartInitial());

  Future<void> loadCart() async {
    emit(const CartLoading());
    try {
      final items = await _cartRepo.getItems();
      emit(CartLoaded(items));
    } catch (e) {
      emit(CartFailure(e.toString()));
    }
  }

  Future<AddToCartResult> addItem(CartItemModel item) async {
    try {
      final result = await _cartRepo.addItem(item);
      if (result.status == CartOperationStatus.restaurantConflict) {
        final pendingItem = result.pendingItem;
        if (pendingItem == null) {
          emit(const CartFailure('Restaurant conflict item is missing.'));
          return AddToCartResult.failure;
        }
        emit(CartRestaurantConflict(result.items, pendingItem));
        return AddToCartResult.restaurantConflict;
      }
      emit(CartLoaded(result.items));
      return AddToCartResult.success;
    } catch (e) {
      emit(CartFailure(e.toString()));
      return AddToCartResult.failure;
    }
  }

  Future<void> increment(String productId) async {
    final items = await _cartRepo.increment(productId);
    emit(CartLoaded(items));
  }

  Future<void> decrementOrRemove(String productId) async {
    final items = await _cartRepo.decrementOrRemove(productId);
    emit(CartLoaded(items));
  }

  Future<void> removeItem(String productId) async {
    final items = await _cartRepo.removeItem(productId);
    emit(CartLoaded(items));
  }

  Future<void> clearCart() async {
    await _cartRepo.clearCart();
    emit(const CartLoaded([]));
  }
}
