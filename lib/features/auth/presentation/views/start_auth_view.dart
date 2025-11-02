import 'package:flutter/material.dart';
import 'package:mego_food/features/auth/presentation/widgets/auth_start_bottom.dart';
import 'package:mego_food/features/auth/presentation/widgets/auth_start_top.dart';

class StartAuthView extends StatelessWidget {
  const StartAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Column(
              spacing: 15,
              children: [
                AuthStartTop(),
                SizedBox(height: 50),
                AuthStartBottom(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
