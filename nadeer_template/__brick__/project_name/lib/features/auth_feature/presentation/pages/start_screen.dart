import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/functions/sized_box_functions.dart';
import '../../../../core/utils/app_language.dart';
import '../../../../core/widgets/custom_loading_widget.dart';
import '../providers/auth_provider.dart';
import 'package:provider/provider.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/custom_elevated_button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AppImages.electronics,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Selector<AuthProvider, bool>(
                      selector: (context, authProvider) =>
                          authProvider.isLoading,
                      child: Column(
                        children: [
                          CustomElevatedButton(
                            buttonSize: Size.fromHeight(50.h),
                            buttonLabel: "login_",
                            fontSize: 16.sp,
                            onPress: () => Navigator.of(context)
                                .pushNamed(Routes.loginScreenRoute),
                          ),
                          15.hh,
                          CustomElevatedButton(
                            buttonSize: Size.fromHeight(50.h),
                            buttonLabel: "register_",
                            foregroundColor: AppColors.primary,
                            backgroundColor: AppColors.white,
                            borderColor: AppColors.primary,
                            fontSize: 16.sp,
                            onPress: () => Navigator.of(context)
                                .pushNamed(Routes.signUpScreenRoute),
                          ),
                          25.hh,
                          Text(
                            "or_continue_with",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontSize: 15),
                          ).tr(),
                          30.hh,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: context.read<AuthProvider>().googleLogin,
                                child: Image.asset(
                                  AppImages.googleImage,
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                              20.ww,
                              InkWell(
                                onTap:
                                    context.read<AuthProvider>().twitterLogin,
                                child: Image.asset(
                                  AppImages.twitterImage,
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                              if (Platform.isIOS) ...[
                                20.ww,
                                InkWell(
                                  onTap:
                                      context.read<AuthProvider>().appleLogin,
                                  child: Image.asset(
                                    AppImages.appleImage,
                                    width: 40,
                                    height: 40,
                                  ),
                                ),
                              ]
                            ],
                          ),
                          20.hh,
                        ],
                      ),
                      builder: (context, isLoading, child) {
                        return isLoading
                            ? Column(
                                children: [
                                  const CustomLoadingWidget(),
                                  180.hh,
                                ],
                              )
                            : child!;
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
          if (Navigator.canPop(context))
            Positioned(
              top: 35.h,
              right: 8.w,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: context.locale == ENGLISH_LOCAL
                    ? Icon(Icons.adaptive.arrow_forward)
                    : Icon(Icons.adaptive.arrow_back),
              ),
            ),
        ],
      ),
    );
  }

// Future<String> dioLoginWithToken(
//     String path, Map<String, dynamic> body) async {
//   final response = await Dio().post(
//     path,
//     data: jsonEncode(body),
//     options: Options(
//       headers: {
//         'Content-Type': 'application/json',
//         'accept': 'application/json',
//         "platform": Platform.isAndroid ? 'android' : "ios",
//       },
//     ),
//   );
//   log("${response.statusCode}");
//   log(jsonEncode(
//     response.data,
//   ));
//   if (response.statusCode == 200) {
//     return response.data.toString();
//   } else {
//     throw "error";
//   }
// }
}
