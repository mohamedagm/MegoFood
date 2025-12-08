import 'package:flutter/material.dart';
import 'package:mego_food/features/cart/presentation/widgets/cart_list_item.dart';

class CartList extends StatefulWidget {
  const CartList({super.key});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) => CartListItem(),
      ),
    );
  }
}
