import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mego_food/core/api/dio_consumer.dart';
import 'package:mego_food/core/routing/app_routes.dart';
import 'package:mego_food/features/auth/data/repo/auth_repo_impl.dart';
import 'package:mego_food/features/auth/presentation/manager/authCubit/auth_cubit.dart';
import 'package:mego_food/features/auth/presentation/widgets/otp_vertification_body.dart';

class VertifyForgetPasswordOtpView extends StatelessWidget {
  const VertifyForgetPasswordOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    final Dio dio = Dio();
    final DioConsumer dioConsumer = DioConsumer(dio: dio);
    final AuthRepoImpl authRepoImpl = AuthRepoImpl(dioConsumer);
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthCubit(authRepoImpl),
        child: OtpVerificationBody(
          title: 'Forgot your\npassword',
          onContinue: () => GoRouter.of(context).push(AppRoutes.newPassword),
        ),
      ),
    );
  }
}
