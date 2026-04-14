import 'package:flutter/material.dart';
import 'package:mego_food/features/home/data/model/restaurant_model.dart';
import 'package:mego_food/features/restaurant_details/presentation/widgets/restaurant_details_view_body.dart';

class RestaurantDetailsView extends StatelessWidget {
  const RestaurantDetailsView({super.key, required this.restaurantModel});
  final RestaurantModel restaurantModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RestaurantDetailsViewBody(restaurantModel: restaurantModel),
    );
  }
}
