import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mego_food/core/routing/app_routes.dart';
import 'package:mego_food/core/services/setup_service.dart';
import 'package:mego_food/core/utils/functions/custom_snack_bar.dart';
import 'package:mego_food/features/auth/data/models/error_login_model.dart';
import 'package:mego_food/features/auth/data/models/validation_error_login_model.dart';
import 'package:mego_food/features/auth/data/repo/auth_repo_impl.dart';
import 'package:mego_food/features/auth/presentation/manager/authCubit/auth_cubit.dart';
import 'package:mego_food/features/auth/presentation/widgets/otp_vertification_body.dart';

class VertifyForgetPasswordOtpView extends StatelessWidget {
  const VertifyForgetPasswordOtpView({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
        body: BlocProvider(
          create: (context) => AuthCubit(getIt.get<AuthRepoImpl>()),
          child: OtpVerificationBody(
            isVertifyPassword: true,
            email: email,
            title: 'Forgot your\npassword',
            listener: (context, state) {
              FocusScope.of(context).unfocus();
              if (state is AuthVertifyForgetPasswordOtp) {
                customSnackbar(
                  context,
                  'Created Successfully',
                  SnackbarType.success,
                );
                GoRouter.of(
                  context,
                ).push(AppRoutes.newPassword, extra: [email, state.resetToken]);
              } else if (state is AuthForgetPassword) {
                customSnackbar(
                  context,
                  'resend Successfully',
                  SnackbarType.success,
                );
              } else if (state is AuthFailure) {
                final failure = state.failure;
                if (failure is ValidationErrorAuthModel) {
                  customSnackbar(
                    context,
                    failure.errors.values.first.first,
                    SnackbarType.error,
                  );
                } else if (failure is ErrorAuthModel) {
                  customSnackbar(
                    context,
                    failure.error.message,
                    SnackbarType.error,
                  );
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
