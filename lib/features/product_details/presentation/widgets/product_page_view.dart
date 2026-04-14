import 'package:flutter/material.dart';
import 'package:mego_food/features/home/data/model/product_model.dart';

class ProductPageView extends StatelessWidget {
  const ProductPageView({
    super.key,
    required this.controller,
    required this.productModel,
  });

  final PageController controller;
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: PageView(
        onPageChanged: (value) {},
        controller: controller,
        children: List.generate(
          3,
          (index) => Container(
            margin: EdgeInsets.only(right: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                productModel.imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
