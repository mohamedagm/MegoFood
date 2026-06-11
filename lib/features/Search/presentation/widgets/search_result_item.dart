import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/widgets/app_cached_image.dart';
import 'package:mego_food/features/search/data/models/result_item_model.dart';

class SearchResultItem extends StatelessWidget {
  const SearchResultItem({super.key, required this.item, required this.onTap});

  final ResultItemModel item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Ink(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: context.exColors.grey0,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: context.exColors.grey100),
          boxShadow: [
            BoxShadow(
              color: context.exColors.grey500_6,
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: AppCachedImage(
                imageUrl: item.imageUrl,
                height: 104,
                width: 104,
                fallbackAsset: 'assets/images/product.png',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: SizedBox(
                height: 104,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            item.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: context.exTextStyles.medium700.copyWith(
                              color: context.exColors.typography500,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        _OpenDetailsButton(),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: context.exTextStyles.small500.copyWith(
                        color: context.exColors.typography300,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: context.exColors.primary100,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text(
                            '\$${item.price.toStringAsFixed(2)}',
                            style: context.exTextStyles.robotoSmall.copyWith(
                              color: context.exColors.primary700,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.touch_app_rounded,
                          size: 18,
                          color: context.exColors.grey400,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Details',
                          style: context.exTextStyles.small600.copyWith(
                            color: context.exColors.typography400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OpenDetailsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 32,
      decoration: BoxDecoration(
        color: context.exColors.grey100,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.arrow_forward_ios_rounded,
        size: 14,
        color: context.exColors.primary600,
      ),
    );
  }
}
