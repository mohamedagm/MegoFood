import 'package:flutter/material.dart';
import 'package:mego_food/features/restaurant_details/presentation/widgets/restaurant_details_view_body.dart';

class RestaurantDetailsView extends StatelessWidget {
  const RestaurantDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RestaurantDetailsViewBody(),
    );
  }
}
