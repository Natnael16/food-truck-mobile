import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/app_routes.dart';
import '../../../core/theme/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  late GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = GoRouter.of(context);
    Future.delayed(const Duration(seconds: 3), () async {
      _router.go(AppRoutes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter,
            colors: [
              primaryColor,
              primaryLightColor,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                child: Transform.scale(
                  scale: 1,
                  child: const Text("Food Truck", style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: white,),textAlign: TextAlign.center)
,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
