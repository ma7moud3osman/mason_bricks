import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/app/app_prefs.dart';
import '../../../../core/app/injection_container.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/widgets/custom_loading_widget.dart';
import '../../../user_feature/domain/entities/user.dart';
import '../../../user_feature/presentation/provider/user_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      if (context.mounted) {
        final user = instance<AppPreferences>().getUser();
        if (user == null) {
          // Navigator.of(context).popAndPushNamed(Routes.startScreenRoute);
          Navigator.of(context).popAndPushNamed(Routes.navigationBarRoute);
        } else {
          context.read<UserProvider>().setUser(
                user,
                isNeedToSaveLocal: false,
              );
          await context.read<UserProvider>().getMyProfile();
          if (context.mounted) {
            switch (context.read<UserProvider>().currentUser?.role) {
              case Roles.fulfillment:
                // TODO: Handle this case.
                break;
              case Roles.admin:
                // TODO: Handle this case.
                break;
              case Roles.driver:
                // TODO: Handle this case.
                break;
              case Roles.user:
                // TODO: Handle this case.
                break;
              default:
                break;
            }

            Navigator.of(context).popAndPushNamed(
              context.read<UserProvider>().currentUser == null
                  // ? Routes.startScreenRoute
                  ? Routes.navigationBarRoute
                  : getScreenName(context.read<UserProvider>().currentUser),
            );
          }
        }
      }
    });
    super.initState();
  }

  String getScreenName(User? user) {
    switch (user?.role) {
      case Roles.fulfillment:
        return Routes.fulfillmentNavigationBarScreen;
      case Roles.admin:
        return Routes.adminNavigationBarScreen;
      case Roles.driver:
        return Routes.deliveryNavigationBarScreen;
      default:
        return Routes.navigationBarRoute;
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomLoadingWidget(),
    );
  }
}
