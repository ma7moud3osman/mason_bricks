import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../features/user_feature/presentation/provider/user_provider.dart';
import '../app/app.dart';
import '../utils/app_strings.dart';

class AppInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[AppStrings.contentType] = AppStrings.applicationJson;

    options.headers[AppStrings.accept] = AppStrings.applicationJson;
    // options.headers[AppStrings.tokenKey] = AppStrings.tokenValue;
    if (navContext.read<UserProvider>().isAuth) {
      options.headers[AppStrings.tokenKey] =
          "Bearer ${navContext.read<UserProvider>().currentUser?.token}";
    }
    options.headers[AppStrings.localizationKey] =
        navigationKey.currentContext?.locale.languageCode;

    log('REQUEST[${options.method}] => PATH: ${options.path}');
    log('REQUEST Headers: ${options.headers}');

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    if (response.statusCode == 401) {
      navContext.read<UserProvider>().logOut();
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}
