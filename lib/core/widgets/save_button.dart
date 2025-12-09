import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key, required this.data});
  final Map<String, dynamic> data;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () => GoRouter.of(context).pop(data),
      child: Row(
        children: [
          Text(
            'save',
            style: context.exTextStyles.medium700.copyWith(
              color: context.exColors.typography500,
            ),
          ),
        ],
      ),
    );
  }
}
