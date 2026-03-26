import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mego_food/core/services/setup_service.dart';
import 'package:mego_food/features/home/data/repo/home_repo.dart';
import 'package:mego_food/features/home/presentation/cubit/home_cubit.dart';
import 'package:mego_food/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeCubit(getIt.get<HomeRepo>())
          ..getBaseCategories()
          ..getTopRatedProducts(),
        child: HomeViewBody(),
      ),
    );
  }
}
