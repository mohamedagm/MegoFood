import 'package:flutter/material.dart';
import 'package:mego_food/features/cart/presentation/widgets/cart_footer.dart';
import 'package:mego_food/features/cart/presentation/widgets/cart_header.dart';
import 'package:mego_food/features/cart/presentation/widgets/cart_list.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            spacing: 20,
            children: [CartHeader(), CartList(), CartFooter()],
          ),
        ),
      ),
    );
  }
}
