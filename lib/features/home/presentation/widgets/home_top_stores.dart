import 'package:flutter/material.dart';
import 'package:mego_food/features/home/presentation/widgets/store_card.dart';

class HomeTopStores extends StatelessWidget {
  const HomeTopStores({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 5,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: StoreCard(),
      ),
    );
  }
}
