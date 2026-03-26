import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mego_food/features/home/presentation/cubit/home_cubit.dart';
import 'package:mego_food/features/home/presentation/cubit/home_state.dart';
import 'package:mego_food/features/home/presentation/widgets/top_rated_item.dart';

class HomeTopRated extends StatelessWidget {
  const HomeTopRated({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.topRatedProductsStatus == RequestStatus.success) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.topRatedProducts.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TopRatedItem(
                        productModel: state.topRatedProducts[index],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state.topRatedProductsStatus == RequestStatus.loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.topRatedProductsStatus == RequestStatus.failure) {
          return Text(state.topRatedProductsError ?? 'Error');
        }
        return SizedBox();
      },
    );
  }
}
