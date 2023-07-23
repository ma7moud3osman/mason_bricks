import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../features/auth_feature/presentation/pages/forget_password_screen.dart';
import '../../features/auth_feature/presentation/pages/login_screen.dart';
import '../../features/auth_feature/presentation/pages/otp_update_password_screen.dart';
import '../../features/auth_feature/presentation/pages/signup_screen.dart';
import '../../features/auth_feature/presentation/pages/splash_screen.dart';
import '../../features/auth_feature/presentation/pages/start_screen.dart';
import '../../features/auth_feature/presentation/pages/verification_screen.dart';
import '../../features/general_screen/help_screen.dart';
import '../../features/my_details_screen.dart';
import '../../features/store_screen.dart';
import '../../features/update_password_screen.dart';
import '../utils/app_strings.dart';

class Routes {
  static const String splashScreen = "/";
  static const String forgetPasswordScreen = "/ForgetPasswordScreen";
  static const String startScreenRoute = "/StartScreen";
  static const String loginScreenRoute = "/LoginScreenRoute";
  static const String signUpScreenRoute = "/SignUpScreenRoute";
  static const String navigationBarRoute = "/navigationBarScreen";
  static const String adminUserScreen = "/AdminUserScreen";
  static const String groceriesScreen = "/GroceriesScreen";
  static const String productDetailsScreen = "/ProductDetailsScreen";
  static const String deliverAddressRoute = "/DeliverAddressScreen";
  static const String fulfillmentNavigationBarScreen =
      "/fulfillmentNavigationBarScreen";
  static const String addEditAddressRoute = "/AddEditAddressScreen";
  static const String regionScreen = "/RegionScreen";
  static const String addEditRegionScreen = "/AddEditRegionScreen";
  static const String helpRoute = "/HelpScreen";
  static const String adminCouponsScreen = "/AdminCouponsScreen";
  static const String myDetailsRoute = "/MyDetailsScreen";
  static const String myWalletScreenRoute = "/MyWalletScreen";
  static const String sendMoneyScreenRoute = "/sendMoneyScreen";
  static const String termsOfUseRoute = "/TermsOfUseScreen";
  static const String businessInfoRoute = "/BusinessInfoScreen";
  static const String productConfigRoute = "/ProductConfigScreen";
  static const String appMissionRoute = "/AppMissionScreen";
  static const String appVisionRoute = "/AppVisionScreen";
  static const String ordersRoute = "/OrdersScreen";
  static const String walletsScreen = "/WalletsScreen";
  static const String favoriteRoute = "/FavoriteScreen";
  static const String ordersDetailsRoute = "/OrdersDetailsScreen";
  static const String updatePasswordRoute = "/UpdatePasswordScreen";
  static const String aboutRoute = "/aboutRoute";
  static const String verificationScreen = "/VerificationScreen";
  static const String otpUpdatePasswordScreen = "/OtpUpdatePasswordScreen";
  static const String storeRoute = "/storeRoute";
  static const String userDetailsScreen = "/UserDetailsScreen";
  static const String privacyRoute = "/privacyRoute";
  static const String contactUsRoute = "/ContactUsScreen";
  static const String appConfigRoute = "/appConfigScreen";
  static const String termsRoute = "/termsRoute";
  static const String adminContactUsScreen = "/AdminContactUsScreen";
  static const String fulfillmentOrderScreen = "/FulfillmentOrderScreen";

  static const String adminNavigationBarScreen = "/AdminNavigationBarScreen";
  static const String deliveryNavigationBarScreen =
      "/DeliveryNavigationBarScreen";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SplashScreen(),
        );
      case Routes.startScreenRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const StartScreen(),
        );
      case Routes.forgetPasswordScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ForgetPasswordScreen(),
        );
      case Routes.verificationScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => VerificationScreen(
              verificationScreenModel: args as VerificationScreenModel),
        );
      case Routes.loginScreenRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const LoginScreen(),
        );

      case Routes.otpUpdatePasswordScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const OtpUpdatePasswordScreen(),
        );

      case Routes.signUpScreenRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SignUpScreen(),
        );

      case Routes.helpRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const HelpScreen(),
        );
      case Routes.myDetailsRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const MyDetailsScreen(),
        );

      case Routes.updatePasswordRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const UpdatePasswordScreen(),
        );

      case Routes.storeRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const StoreScreen(),
        );

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.noRouteFound.tr()),
        ),
        body: Center(
          child: Text(
            AppStrings.noRouteFound.tr(),
          ),
        ),
      ),
    );
  }
}
