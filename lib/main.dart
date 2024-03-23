import 'package:flutter/material.dart';
import 'core/injections/injections.dart';
import 'core/routes/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/home/presentation/bloc/search_bloc/search_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectionInit();

  runApp(MultiBlocProvider(providers: [
    BlocProvider<SearchBloc>(create: (_) => SearchBloc() ,)
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppRouter();
  }
}
