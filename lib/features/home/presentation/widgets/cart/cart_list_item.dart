import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class CartListItem extends StatefulWidget {
  const CartListItem({super.key});

  @override
  State<CartListItem> createState() => _CartListItemState();
}

class _CartListItemState extends State<CartListItem> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.exColors.grey100),
      ),
      margin: const EdgeInsets.all(8),
      height: 82,
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
              height: 80,
              width: 80,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pepperoni Cheese Pizza',
                  style: context.exTextStyles.medium,
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(r'$12.99', style: context.exTextStyles.robotoMedium),
                    Container(
                      width: 95,
                      height: 40,
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        border: Border.all(color: context.exColors.grey100),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => setState(() {
                              if (count > 1) count--;
                            }),
                            child: Container(
                              height: 32,
                              width: 32,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: context.exColors.grey100,
                              ),
                              child: count == 1
                                  ? SvgPicture.asset('assets/icons/Delete.svg')
                                  : Icon(Icons.remove),
                            ),
                          ),
                          Text(
                            '$count',
                            style: context.exTextStyles.robotoMedium,
                          ),
                          InkWell(
                            onTap: () => setState(() {
                              count++;
                            }),
                            child: Container(
                              height: 32,
                              width: 32,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: context.exColors.grey100,
                              ),
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
