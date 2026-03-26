import 'package:flutter/material.dart';
import 'package:mego_food/features/home/data/model/product_model.dart';
import 'package:mego_food/features/home/presentation/widgets/product_item.dart';

class TopRatedItem extends StatelessWidget {
  const TopRatedItem({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return ProductItem(productModel: productModel);
  }
}
