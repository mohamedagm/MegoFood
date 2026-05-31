import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mego_food/core/cache/cache_helper.dart';
import 'package:mego_food/core/routing/app_router.dart';
import 'package:mego_food/core/services/setup_service.dart';
import 'package:mego_food/core/storage/hive_storage_service.dart';
import 'package:mego_food/core/theme/app_theme.dart';
import 'package:mego_food/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:mego_food/features/cart/data/repo/cart_repo.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await CacheHelper.init();
  SetupService.setup();
  final storage = getIt<HiveStorageService>();
  await storage.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return BlocProvider(
      create: (_) => CartCubit(getIt<CartRepo>())..loadCart(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.system,
      ),
    );
  }
}
