import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/functions/sized_box_functions.dart';
import '../../core/utils/app_colors.dart';

class HeaderAboutWidget extends StatelessWidget {
  final String text;

  const HeaderAboutWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        children: [
          Container(
            height: 35,
            width: 5,
            color: AppColors.secondary,
          ),
          10.ww,
          Text(
            text.tr(),
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: AppColors.text1,
                  fontWeight: FontWeight.w900,
                  fontSize: 21,
                ),
          )
        ],
      ),
    );
  }
}
