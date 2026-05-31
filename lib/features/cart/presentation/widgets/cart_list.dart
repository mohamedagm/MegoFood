import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mego_food/features/cart/data/models/cart_item_model.dart';
import 'package:mego_food/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:mego_food/features/cart/presentation/widgets/cart_list_item.dart';

class CartList extends StatelessWidget {
  const CartList({super.key, required this.items});
  final List<CartItemModel> items;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return CartListItem(
            item: item,
            onIncrement: () {
              context.read<CartCubit>().increment(item.productId);
            },
            onDecrementOrRemove: () {
              context.read<CartCubit>().decrementOrRemove(item.productId);
            },
            onRemove: () {
              context.read<CartCubit>().removeItem(item.productId);
            },
          );
        },
      ),
    );
  }
}
