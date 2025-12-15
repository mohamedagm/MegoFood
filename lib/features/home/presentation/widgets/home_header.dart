import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mego_food/core/routing/app_routes.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hi Daniel', style: context.exTextStyles.medium400),
            Text('What are you carving?', style: context.exTextStyles.large400),
          ],
        ),
        GestureDetector(
          onTap: () => GoRouter.of(context).push(AppRoutes.menu),
          child: CircleAvatar(radius: 24, child: Icon(Icons.person)),
        ),
      ],
    );
  }
}
