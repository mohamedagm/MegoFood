import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mego_food/core/routing/app_routes.dart';
import 'package:mego_food/core/services/setup_service.dart';
import 'package:mego_food/features/auth/data/repo/auth_repo_impl.dart';
import 'package:mego_food/features/auth/presentation/manager/authCubit/auth_cubit.dart';
import 'package:mego_food/features/auth/presentation/widgets/otp_vertification_body.dart';

class VertifyForgetPasswordOtpView extends StatelessWidget {
  const VertifyForgetPasswordOtpView({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthCubit(getIt.get<AuthRepoImpl>()),
        child: OtpVerificationBody(
          email: email,
          title: 'Forgot your\npassword',
          onContinue: () => GoRouter.of(context).push(AppRoutes.newPassword),
        ),
      ),
    );
  }
}
