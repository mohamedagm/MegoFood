import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class FavoriteItem extends StatefulWidget {
  const FavoriteItem({super.key});

  @override
  State<FavoriteItem> createState() => _FavoriteItemState();
}

class _FavoriteItemState extends State<FavoriteItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.exColors.grey100),
      ),
      margin: const EdgeInsets.all(8),
      height: 108,
      child: Row(
        spacing: 4,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(4),
              bottomRight: Radius.circular(4),
              bottomLeft: Radius.circular(16),
              topLeft: Radius.circular(16),
            ),
            child: Image.asset(
              fit: BoxFit.cover,
              'assets/images/pizaa.png',
              height: 108,
              width: 120,
            ),
          ),
          Expanded(
            child: Column(
              spacing: 12,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(),
                Text(
                  'Pepperoni Cheese Pizza',
                  style: context.exTextStyles.medium,
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                ),
                Text(r'$12.99', style: context.exTextStyles.robotoMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
