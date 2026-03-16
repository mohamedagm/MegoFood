import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mego_food/core/services/setup_service.dart';
import 'package:mego_food/features/auth/data/models/address_model.dart';
import 'package:mego_food/features/auth/data/repo/auth_repo_impl.dart';
import 'package:mego_food/features/auth/presentation/manager/authCubit/auth_cubit.dart';
import 'package:mego_food/features/auth/presentation/widgets/add_address_view_body.dart';

class AddAddressView extends StatelessWidget {
  const AddAddressView({super.key, this.initialData});
  final AddressModel? initialData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
        body: BlocProvider(
          create: (context) => AuthCubit(getIt.get<AuthRepoImpl>()),
          child: AddAddressViewBody(initialData: initialData),
        ),
      ),
    );
  }
}
