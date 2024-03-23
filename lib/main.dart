import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'core/injections/injections.dart';
import 'core/routes/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectionInit();

  runApp(MyApp()
      // return MultiBlocProvider(providers: [
      //   //! Should be atleast one provider
      // ], child: const MyApp());

      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
      return AppRouter();
  }
}
