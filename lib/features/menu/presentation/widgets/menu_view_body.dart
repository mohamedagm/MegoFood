import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/features/menu/presentation/widgets/menu_tabs.dart';

class MenuViewBody extends StatefulWidget {
  const MenuViewBody({super.key});

  @override
  State<MenuViewBody> createState() => _MenuViewBodyState();
}

class _MenuViewBodyState extends State<MenuViewBody> {
  bool isOn = false;
  List<String> iconsList = [
    'assets/icons/Profile.svg',
    'assets/icons/Orders.svg',
    'assets/icons/Credit Card.svg',
    'assets/icons/Location.svg',
    'assets/icons/Subscription.svg',
    'assets/icons/Settings.svg',
    '',
  ];
  List<String> titlesList = [
    'My Account',
    'My Orders',
    'Payment',
    'Addresses',
    'Subscription',
    'Settings',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Row(
              spacing: 20,
              children: [
                SvgPicture.asset(
                  'assets/icons/Close.svg',
                  width: 32,
                  height: 32,
                  fit: BoxFit.fitHeight,
                ),
                Image.asset('assets/images/mego.png'),
              ],
            ),

            Row(
              spacing: 16,
              children: [
                CircleAvatar(radius: 40, child: Icon(Icons.person)),
                Column(
                  spacing: 4,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Daniel Jones', style: context.exTextStyles.large),
                    Text(
                      'daniel.jones@example.com',
                      style: context.exTextStyles.small,
                    ),
                    Container(
                      height: 28,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: context.exColors.grey0,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: context.exColors.grey200),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/Star filled.svg',
                            colorFilter: ColorFilter.mode(
                              context.exColors.yellow,
                              BlendMode.srcIn,
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Premium',
                              style: context.exTextStyles.small.copyWith(
                                color: context.exColors.typography300,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Text('General', style: context.exTextStyles.small600),

            ...List.generate(
              6,
              (index) => MenuTab(
                prefIconLink: iconsList[index],
                title: titlesList[index],
              ),
            ),
            Text('Theme', style: context.exTextStyles.small600),
            Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: context.exColors.grey50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                spacing: 12,
                children: [
                  SvgPicture.asset('assets/icons/Dark mode.svg'),
                  Text('Dark mode', style: context.exTextStyles.medium400),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isOn = !isOn;
                      });
                    },
                    child: Container(
                      width: 50,
                      height: 30,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: context.exColors.grey0,
                        borderRadius: BorderRadius.circular(32),
                        border: Border.all(color: context.exColors.grey200),
                      ),
                      child: AnimatedAlign(
                        duration: const Duration(milliseconds: 250),
                        alignment: isOn
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            color: isOn
                                ? context.exColors.primary600
                                : context.exColors.grey400,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
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
