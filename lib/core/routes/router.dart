import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../features/home/presentation/screens/home.dart';
import '../../features/splash/screens/splash_screen.dart';
import '../theme/app_theme.dart';
import 'app_routes.dart';

class AppRouter extends StatelessWidget {
  late final GoRouter _router;

  AppRouter({super.key}) {
    _router = GoRouter(
      initialLocation: AppRoutes.splash,
      routes: <GoRoute>[
        GoRoute(
          path: AppRoutes.splash,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: AppRoutes.home,
          builder: (context, state) => DriverHome(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) =>
      ResponsiveSizer(builder: (_, orientation, screenType) {
        return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routeInformationProvider: _router.routeInformationProvider,
            routeInformationParser: _router.routeInformationParser,
            routerDelegate: _router.routerDelegate,
            theme: appTheme);
      });
}
