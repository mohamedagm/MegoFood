import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class ProductDesc extends StatefulWidget {
  const ProductDesc({super.key});

  @override
  State<ProductDesc> createState() => _ProductDescState();
}

class _ProductDescState extends State<ProductDesc> {
  bool readMore = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        readMore = true;
      }),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'A classic favorite! Indulge in a crispy, thin crust topped with rich tomato sauce, layers of gooey mozzarella cheese, and delicious pepperoni slices. Perfectly baked with a hint of herbs for a mouth-watering experience in every bite.',
            style: context.exTextStyles.small,
            maxLines: readMore ? 2 : 10,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4),
          if (readMore)
            GestureDetector(
              onTap: () => setState(() {
                readMore = false;
              }),
              child: Text('Read more...', style: context.exTextStyles.small600),
            ),
          if (readMore)
            Container(
              width: 85,
              height: 3,
              decoration: BoxDecoration(
                color: context.exColors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
        ],
      ),
    );
  }
}
