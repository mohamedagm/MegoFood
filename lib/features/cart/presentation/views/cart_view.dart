import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mego_food/features/cart/data/models/cart_item_model.dart';
import 'package:mego_food/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:mego_food/features/cart/presentation/manager/cart_cubit/cart_state.dart';
import 'package:mego_food/features/cart/presentation/widgets/cart_footer.dart';
import 'package:mego_food/features/cart/presentation/widgets/cart_header.dart';
import 'package:mego_food/features/cart/presentation/widgets/cart_list.dart';
import 'package:mego_food/features/cart/presentation/widgets/empty_cart.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  Widget _buildCartContent(List<CartItemModel> items, double total) {
    if (items.isEmpty) {
      return const EmptyCart();
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            spacing: 20,
            children: [
              const CartHeader(),
              CartList(items: items),
              CartFooter(total: total),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return switch (state) {
          CartInitial() || CartLoading() => const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          ),
          CartLoaded(:final items) => _buildCartContent(items, state.total),
          CartFailure(:final message) => Scaffold(
            body: Center(child: Text(message)),
          ),
          CartRestaurantConflict(:final items) => _buildCartContent(
            items,
            state.total,
          ),
        };
      },
    );
  }
}
