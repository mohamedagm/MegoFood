import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mego_food/core/services/setup_service.dart';
import 'package:mego_food/features/auth/data/repo/auth_repo_impl.dart';
import 'package:mego_food/features/auth/presentation/manager/authCubit/auth_cubit.dart';
import 'package:mego_food/features/auth/presentation/widgets/pick_from_map_view_body.dart';

class PickFromMapView extends StatelessWidget {
  const PickFromMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pick Location from Map')),
      body: BlocProvider(
        create: (context) => AuthCubit(getIt.get<AuthRepoImpl>()),
        child: PickFromMapViewBody(),
      ),
    );
  }
}
