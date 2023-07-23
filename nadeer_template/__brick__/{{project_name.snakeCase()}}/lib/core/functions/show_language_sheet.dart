import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_language.dart';
import '../app/app.dart';
import '../utils/app_images.dart';
import '../widgets/custom_bottom_sheet.dart';
import 'sized_box_functions.dart';

showLanguageBottomSheet() {
  final context = navContext;
  showBottomSheetWidget(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: const Text('change_language').tr(),
        ),
        16.hh,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.border, width: 1.w),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: Column(
              children: [
                ListTile(
                  minVerticalPadding: 10,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.transparent, width: 1.w),
                  ),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(4).r,
                    child: SvgPicture.asset(
                      AppImages.arabic,
                      width: 20,
                      height: 20,
                    ),
                  ),
                  title: const Text("اللغة العربيه"),
                  onTap: () {
                    if (context.locale == ENGLISH_LOCAL) {
                      context.setLocale(ARABIC_LOCAL);
                      Navigator.of(context).pop();
                    }
                  },
                ),
                const Divider(
                  endIndent: 15,
                  indent: 15,
                ),
                ListTile(
                  minVerticalPadding: 18,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.transparent, width: 1.w),
                  ),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(4).r,
                    child: SvgPicture.asset(
                      AppImages.english,
                      width: 20,
                      height: 20,
                    ),
                  ),
                  title: const Text("English"),
                  onTap: () {
                    if (context.locale == ARABIC_LOCAL) {
                      context.setLocale(ENGLISH_LOCAL);
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        32.hh,
      ],
    ),
  );
}
