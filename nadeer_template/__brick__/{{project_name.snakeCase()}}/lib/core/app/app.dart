import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../features/auth_feature/domain/usecases/apple_login_use_case.dart';
import '../../features/auth_feature/domain/usecases/email_and_password_login_use_case.dart';
import '../../features/auth_feature/domain/usecases/google_login_use_case.dart';
import '../../features/auth_feature/domain/usecases/signup_use_case.dart';
import '../../features/auth_feature/domain/usecases/twitter_login_use_case.dart';
import '../../features/auth_feature/presentation/providers/auth_provider.dart';
import '../../features/user_feature/presentation/provider/user_provider.dart';
import '../routes/app_routes.dart';
import '../utils/app_theme.dart';
import 'injection_container.dart';

final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

BuildContext get navContext => navigationKey.currentContext!;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => instance<UserProvider>()),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(
            appleLoginUseCase: instance<AppleLoginUseCase>(),
            emailLoginUseCase: instance<EmailLoginUseCase>(),
            googleLoginUseCase: instance<GoogleLoginUseCase>(),
            twitterLoginUseCase: instance<TwitterLoginUseCase>(),
            signUpUseCase: instance<SignUpUseCase>(),
            userProvider: context.read<UserProvider>(),
          ),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "{{project_name.titleCase()}}",
            navigatorKey: navigationKey,
            theme: getAppTheme(context, false),
            darkTheme: getAppTheme(context, true),
            themeMode:
                // context.watch<ThemeProvider>().isDarkMode
                //     ? ThemeMode.dark
                //     :
                ThemeMode.light,
            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: Routes.splashScreen,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
          );
        },
      ),
    );
  }
}
