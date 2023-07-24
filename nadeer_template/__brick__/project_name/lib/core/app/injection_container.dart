import 'dart:io';

import 'package:get_it/get_it.dart';

import '../injection_function/auth_injection.dart';
import '../injection_function/image_injection.dart';
import '../injection_function/mainapp_injection.dart';
import '../injection_function/user_injection.dart';

final instance = GetIt.instance;

Future<void> initAppModule(SecurityContext? securityContext) async {
  await initMainAppModule(securityContext);
  initUserModule();
  initAuthModule();
  initImageModule();
}
