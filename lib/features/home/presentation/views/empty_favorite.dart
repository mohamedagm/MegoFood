import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/widgets/app_elevated_button.dart';

class EmptyFavorite extends StatelessWidget {
  const EmptyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              spacing: 12,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/Empty_state_light_mode.svg'),
                Text(
                  'Nothing found here!',
                  style: context.exTextStyles.heading1,
                ),
                Text(
                  'Explore and add items to the favourites\nto show here...',
                  style: context.exTextStyles.medium,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: 120,
                  height: 45,
                  child: AppElevatedButton(
                    onPressed: () {},
                    buttonType: AppButtonType.primary,
                    child: Text('Explore'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
