import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/features/home/data/model/product_model.dart';

class ProductCount extends StatelessWidget {
  const ProductCount({
    super.key,
    required this.productModel,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });
  final ProductModel productModel;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(productModel.name, style: context.exTextStyles.large,
            maxLines: 2, overflow: TextOverflow.fade),
        ),
        Container(
          height: 50, width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            border: Border.all(color: context.exColors.grey100),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: onIncrement,
                child: Container(height: 40, width: 40,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: context.exColors.grey100),
                  child: Icon(Icons.add),
                ),
              ),
              Text('$quantity', style: context.exTextStyles.robotoMedium),
              InkWell(
                onTap: onDecrement,
                child: Container(height: 40, width: 40,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: context.exColors.grey100),
                  child: Icon(Icons.remove),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
