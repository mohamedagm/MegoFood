import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mego_food/core/services/setup_service.dart';
import 'package:mego_food/features/auth/data/repo/auth_repo_impl.dart';
import 'package:mego_food/features/auth/presentation/manager/authCubit/auth_cubit.dart';
import 'package:mego_food/features/auth/presentation/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
        body: BlocProvider(
          create: (context) => AuthCubit(getIt.get<AuthRepoImpl>()),
          child: const RegisterViewBody(),
        ),
      ),
    );
  }
}
