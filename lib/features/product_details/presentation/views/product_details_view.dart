import 'package:flutter/material.dart';
import 'package:mego_food/features/home/data/model/product_model.dart';
import 'package:mego_food/features/product_details/presentation/widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ProductDetailsViewBody(productModel: productModel));
  }
}
