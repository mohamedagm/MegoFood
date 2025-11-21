import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mego_food/core/cache/cache_helper.dart';
import 'package:mego_food/core/routing/app_router.dart';
import 'package:mego_food/core/services/setup_service.dart';
import 'package:mego_food/core/theme/app_theme.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await CacheHelper.init();
  SetupService.setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: AppTheme.light,
    );
  }
}
