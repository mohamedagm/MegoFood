import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/widgets/app_elevated_button.dart';

class HomeOffers extends StatelessWidget {
  const HomeOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: context.exColors.primary100,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              children: [
                Positioned(
                  right: -40,
                  top: 10,
                  bottom: 10,
                  child: SizedBox(
                    child: Image.asset('assets/images/burger_background.png'),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        spacing: 12,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '35% OFF on\nBurgers!',
                            style: context.exTextStyles.heading2,
                          ),
                          SizedBox(
                            width: 110,
                            height: 32,
                            child: AppElevatedButton(
                              buttonType: AppButtonType.primary,
                              onPressed: () {},
                              textStyle: context.exTextStyles.small700,
                              child: Text('Buy now'),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: SizedBox(
                        height: double.infinity,
                        child: Image.asset(
                          'assets/images/burger.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
