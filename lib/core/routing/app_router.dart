import 'package:go_router/go_router.dart';
import 'package:mego_food/core/routing/app_routes.dart';
import 'package:mego_food/features/auth/presentation/views/login_view.dart';
import 'package:mego_food/features/auth/presentation/views/start_auth_view.dart';
import 'package:mego_food/features/onBoarding/presentation/views/boarding_view.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.onboarding,
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const BoardingView(),
      ),
      GoRoute(
        path: AppRoutes.startAuth,
        builder: (context, state) => const StartAuthView(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginView(),
      ),
    ],
  );
}
