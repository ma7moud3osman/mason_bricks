import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../core/app/app.dart';
import '../../core/functions/sized_box_functions.dart';
import '../../core/utils/app_images.dart';
import '../../core/widgets/custom_elevated_button.dart';

successDialogWidget({
  required String title,
  required String content,
  required String buttonName,
  String? screen,
}) {
  final context = navContext;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          height: 360,
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(AppImages.correct, width: 180),
              Text(
                title.tr(),
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 22),
              ),
              15.hh,
              Text(
                content.tr(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              15.hh,
              SizedBox(
                width: 350,
                child: CustomElevatedButton(
                  buttonSize: Size.fromHeight(50.h),
                  buttonLabel: buttonName.tr(),
                  fontSize: 16.sp,
                  onPress: () {
                    screen != null
                        ? Navigator.popUntil(
                            context,
                            (route) {
                              print('${route.settings.name}');
                              return route.settings.name == screen;
                            },
                          )
                        : Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
