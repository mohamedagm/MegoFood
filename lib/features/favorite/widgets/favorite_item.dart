import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/widgets/app_cached_image.dart';
import 'package:mego_food/features/favorite/data/models/favorite_item_model.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key, required this.item, this.onTap});

  final FavoriteItemModel item;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
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
              child: AppCachedImage(
                imageUrl: item.imageUrl,
                height: 108,
                width: 120,
                fallbackAsset: 'assets/images/pizaa.png',
              ),
            ),
            Expanded(
              child: Column(
                spacing: 12,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(),
                  Text(
                    item.name,
                    style: context.exTextStyles.medium,
                    maxLines: 2,
                    overflow: TextOverflow.fade,
                  ),
                  Text(
                    '\$${item.price.toStringAsFixed(2)}',
                    style: context.exTextStyles.robotoMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
