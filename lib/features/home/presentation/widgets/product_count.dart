import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class ProductCount extends StatefulWidget {
  const ProductCount({super.key});

  @override
  State<ProductCount> createState() => _ProductCountState();
}

class _ProductCountState extends State<ProductCount> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            'Pepperoni Cheese\nPizza',
            style: context.exTextStyles.large,
            maxLines: 2,
            overflow: TextOverflow.fade,
          ),
        ),
        Container(
          height: 50,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            border: Border.all(color: context.exColors.grey100),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () => setState(() {
                  count++;
                }),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.exColors.grey100,
                  ),
                  child: Icon(Icons.add),
                ),
              ),
              Text('$count', style: context.exTextStyles.robotoMedium),
              InkWell(
                onTap: () => setState(() {
                  if (count > 1) count--;
                }),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.exColors.grey100,
                  ),
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
