import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class ExploreResultsItem extends StatefulWidget {
  const ExploreResultsItem({super.key});

  @override
  State<ExploreResultsItem> createState() => _ExploreResultsItemState();
}

class _ExploreResultsItemState extends State<ExploreResultsItem> {
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
          Stack(
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
              Positioned(
                top: 4,
                left: 4,
                child: Container(
                  width: 47,
                  height: 20,
                  decoration: BoxDecoration(
                    color: context.exColors.grey0,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/Star filled.svg',
                        height: 16,
                        colorFilter: ColorFilter.mode(
                          context.exColors.yellow,
                          BlendMode.srcIn,
                        ),
                      ),
                      Text('4.7', style: context.exTextStyles.small),
                    ],
                  ),
                ),
              ),
            ],
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
                // if()
                Row(
                  spacing: 8,
                  children: [
                    Text(r'$12.99', style: context.exTextStyles.robotoMedium),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: context.exColors.grey100,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text('10% OFF', style: context.exTextStyles.small),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.exColors.primary100,
                    ),
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () {},
                      child: Icon(
                        Icons.add,
                        size: 20,
                        color: context.exColors.primary600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
