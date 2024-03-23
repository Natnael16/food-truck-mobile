
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../network/network_info.dart';

var getIt = GetIt.instance;

Future<void> injectionInit() async {
  //! Bloc


  //! Usecase

  //! Repository


  //! Data Source


  //! Common

  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));
  getIt.registerLazySingleton(() => InternetConnectionChecker());
}
