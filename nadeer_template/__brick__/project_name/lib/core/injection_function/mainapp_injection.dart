import 'dart:io';

import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/api_consumer.dart';
import '../api/app_interceptors.dart';
import '../api/dio_consumer.dart';
import '../app/app_prefs.dart';
import '../app/injection_container.dart';
import '../network/network_info.dart';

Future<void> initMainAppModule(SecurityContext? securityContext) async {
  // shared prefs instance
  final sharedPrefs = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  instance.registerLazySingleton<Dio>(() => Dio());

  instance.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker(),
  );

  instance.registerSingleton<AppInterceptors>(AppInterceptors());
  instance.registerLazySingleton<LogInterceptor>(
    () => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    ),
  );

  // app prefs instance
  instance.registerLazySingleton<AppPreferences>(
      () => AppPreferences(instance<SharedPreferences>()));

  instance.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(
      client: instance<Dio>(),
      securityContext: securityContext,
    ),
  );

  // network info
  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(
      connectionChecker: instance<InternetConnectionChecker>()));
}
