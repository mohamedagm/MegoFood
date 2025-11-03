import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class AddAddressHeader extends StatelessWidget {
  const AddAddressHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: SizedBox()),
        Text('Add an address', style: context.exTextStyles.large),
        const Expanded(child: SizedBox()),
      ],
    );
  }
}
