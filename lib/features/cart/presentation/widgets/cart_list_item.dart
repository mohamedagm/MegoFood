import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/widgets/app_cached_image.dart';
import 'package:mego_food/features/cart/data/models/cart_item_model.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({
    super.key,
    required this.item,
    required this.onIncrement,
    required this.onDecrementOrRemove,
    required this.onRemove,
  });
  final CartItemModel item;
  final VoidCallback onIncrement;
  final VoidCallback onDecrementOrRemove;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.exColors.grey100),
      ),
      margin: const EdgeInsets.all(8),
      height: 90,
      child: Row(
        spacing: 4,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(4), bottomRight: Radius.circular(4),
                  bottomLeft: Radius.circular(16), topLeft: Radius.circular(16),
                ),
                child: AppCachedImage(
                  imageUrl: item.imageUrl,
                  height: 80,
                  width: 80,
                  fallbackAsset: 'assets/images/pizaa.png',
                ),
              ),
              Positioned(top: 4, left: 4, child: Container(
                width: 47, height: 20,
                decoration: BoxDecoration(color: context.exColors.grey100, borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset('assets/icons/Star filled.svg', height: 16,
                      colorFilter: ColorFilter.mode(context.exColors.yellow, BlendMode.srcIn)),
                    Text('${item.rating}', style: context.exTextStyles.small),
                  ],
                ),
              )),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name, style: context.exTextStyles.medium, maxLines: 2, overflow: TextOverflow.fade),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$${item.unitPrice.toStringAsFixed(2)}', style: context.exTextStyles.robotoMedium),
                    Container(
                      width: 95, height: 40, padding: EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        border: Border.all(color: context.exColors.grey100),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: item.quantity == 1 ? onRemove : onDecrementOrRemove,
                            child: Container(height: 32, width: 32,
                              decoration: BoxDecoration(shape: BoxShape.circle, color: context.exColors.grey100),
                              child: item.quantity == 1
                                  ? SvgPicture.asset('assets/icons/Delete.svg')
                                  : Icon(Icons.remove),
                            ),
                          ),
                          Text('${item.quantity}', style: context.exTextStyles.robotoMedium),
                          InkWell(
                            onTap: onIncrement,
                            child: Container(height: 32, width: 32,
                              decoration: BoxDecoration(shape: BoxShape.circle, color: context.exColors.grey100),
                              child: Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
