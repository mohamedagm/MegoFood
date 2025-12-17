import 'package:go_router/go_router.dart';
import 'package:mego_food/core/routing/app_routes.dart';
import 'package:mego_food/features/auth/presentation/views/add_address_view.dart';
import 'package:mego_food/features/auth/presentation/views/create_profile_view.dart';
import 'package:mego_food/features/auth/presentation/views/forget_password_view.dart';
import 'package:mego_food/features/auth/presentation/views/vertify_forget_password_otp_view.dart';
import 'package:mego_food/features/auth/presentation/views/login_view.dart';
import 'package:mego_food/features/auth/presentation/views/register_view.dart';
import 'package:mego_food/features/auth/presentation/views/reset_password_view.dart';
import 'package:mego_food/features/auth/presentation/views/start_auth_view.dart';
import 'package:mego_food/features/auth/presentation/views/otp_after_register_view.dart';
import 'package:mego_food/features/cart/presentation/views/cart_place_order_view.dart';
import 'package:mego_food/features/cart/presentation/views/add_coupon_view.dart';
import 'package:mego_food/features/cart/presentation/views/checkout_view.dart';
import 'package:mego_food/features/cart/presentation/views/order_placed_view.dart';
import 'package:mego_food/features/cart/presentation/widgets/change_address.dart';
import 'package:mego_food/features/cart/presentation/widgets/change_card.dart';
import 'package:mego_food/features/home/presentation/views/home_product_details_view.dart';
import 'package:mego_food/features/home/presentation/views/home_view.dart';
import 'package:mego_food/features/menu/presentation/views/menu_view.dart';
import 'package:mego_food/features/menu/presentation/views/profile_edit_view.dart';
import 'package:mego_food/features/onBoarding/presentation/views/boarding_view.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.home,
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
      GoRoute(
        path: AppRoutes.register,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: AppRoutes.forgotPassword,
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: AppRoutes.vertifyForgotPassword,
        builder: (context, state) =>
            VertifyForgetPasswordOtpView(email: state.extra as String),
      ),
      GoRoute(
        path: AppRoutes.newPassword,
        builder: (context, state) {
          final list = state.extra as List<String>;
          return ResetPasswordView(email: list[0], resetToken: list[1]);
        },
      ),
      GoRoute(
        path: AppRoutes.otpAfterRegister,
        builder: (context, state) =>
            VertifyEmailOtpView(email: state.extra as String),
      ),
      GoRoute(
        path: AppRoutes.createProfile,
        builder: (context, state) => const CreateProfileView(),
      ),
      GoRoute(
        path: AppRoutes.addAddress,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>?;
          return AddAddressView(initialData: data);
        },
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: AppRoutes.productDetails,
        builder: (context, state) => const HomeProductDetailsView(),
      ),
      GoRoute(
        path: AppRoutes.cartPlaceOrder,
        builder: (context, state) => const CartPlaceOrderView(),
      ),
      GoRoute(
        path: AppRoutes.addCoupon,
        builder: (context, state) => const AddCouponView(),
      ),
      GoRoute(
        path: AppRoutes.checkOut,
        builder: (context, state) => const CheckoutView(),
      ),
      GoRoute(
        path: AppRoutes.changeAddress,
        builder: (context, state) => const ChangeAddress(),
      ),
      GoRoute(
        path: AppRoutes.changeCard,
        builder: (context, state) => const ChangeCard(),
      ),
      GoRoute(
        path: AppRoutes.orderPlaced,
        builder: (context, state) => const OrderPlacedView(),
      ),
      GoRoute(
        path: AppRoutes.menu,
        builder: (context, state) => const MenuView(),
      ),
      GoRoute(
        path: AppRoutes.editProfile,
        builder: (context, state) => const ProfileEditView(),
      ),
    ],
  );
}
