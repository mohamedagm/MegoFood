import 'package:flutter/material.dart';
import 'package:mego_food/features/auth/presentation/widgets/add_address_view_body.dart';

class AddAddressView extends StatelessWidget {
  const AddAddressView({super.key, this.initialData});
  final Map<String, dynamic>? initialData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.translucent,
      child: Scaffold(body: AddAddressViewBody(initialData: initialData)),
    );
  }
}
