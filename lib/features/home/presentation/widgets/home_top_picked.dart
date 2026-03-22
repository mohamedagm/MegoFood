import 'package:flutter/material.dart';
import 'package:mego_food/features/home/presentation/widgets/top_picked_item.dart';

class HomeTopPicked extends StatelessWidget {
  const HomeTopPicked({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return SizedBox(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: TopPickedItem(),
              ),
            ),
          );
        },
      ),
    );
  }
}
