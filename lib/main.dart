import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mego_food/core/cache/cache_helper.dart';
import 'package:mego_food/core/routing/app_router.dart';
import 'package:mego_food/core/services/setup_service.dart';
import 'package:mego_food/core/storage/hive_storage_service.dart';
import 'package:mego_food/core/theme/app_theme.dart';
import 'package:mego_food/features/auth/data/repo/auth_repo_impl.dart';
import 'package:mego_food/features/auth/presentation/manager/userProfileCubit/user_profile_cubit.dart';

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
      create: (_) => UserProfileCubit(getIt<AuthRepoImpl>())..loadProfile(),
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
