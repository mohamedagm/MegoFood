import 'package:flutter/material.dart';
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
        CircleAvatar(radius: 24, child: Icon(Icons.person)),
      ],
    );
  }
}
