import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/widgets/custom_header.dart';
import 'package:mego_food/features/home/presentation/widgets/favorite_item.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            spacing: 24,
            children: [
              CustomHeader(
                title: Row(
                  spacing: 4,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/Like.svg',
                      height: 28,
                      width: 28,
                    ),
                    Text('Favorite', style: context.exTextStyles.large),
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: 5,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (_, index) {
                    return FavoriteItem();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
