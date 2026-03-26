import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mego_food/features/home/presentation/cubit/home_cubit.dart';
import 'package:mego_food/features/home/presentation/cubit/home_state.dart';
import 'package:mego_food/features/home/presentation/widgets/store_card.dart';

class HomeTopStores extends StatelessWidget {
  const HomeTopStores({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.topRatedRestaurantsStatus == RequestStatus.success) {
          return SliverList.builder(
            itemCount: state.topRatedRestaurants.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: StoreCard(
                restaurantModel: state.topRatedRestaurants[index],
              ),
            ),
          );
        } else if (state.topRatedRestaurantsStatus == RequestStatus.loading) {
          return SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state.topRatedRestaurantsStatus == RequestStatus.failure) {
          return SliverToBoxAdapter(
            child: Text(state.topRatedRestaurantsError ?? 'Error'),
          );
        }
        return SliverToBoxAdapter(child: SizedBox());
      },
    );
  }
}
