import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: 40,
              width: double.infinity,
              color: Colors.red,
            ),
          ),
          ElevatedButton(onPressed: () {}, child: const Text('log out')),
          Expanded(
            child: Container(
              height: 40,
              width: double.infinity,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
