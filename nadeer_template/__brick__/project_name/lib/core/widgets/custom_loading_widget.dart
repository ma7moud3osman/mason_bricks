import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';



class CustomLoadingWidget extends StatelessWidget {
  final bool isGif;
  const CustomLoadingWidget({Key? key,  this.isGif=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isGif
          ? Image.asset(
              "assets/icons/animated-icon.gif",
              height: 140.h,
              width: 140.w,
            )
          : const CircularProgressIndicator.adaptive(),
    );
  }
}

class EmptyListWidget extends StatelessWidget {
  final String text;
  const EmptyListWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/gray-logo.png',
            width: 210.w,
            height: 230.h,
          ),
          SizedBox(
            height: 40.h,
          ),
          Text(
            text.tr(),
            style: TextStyle(
              fontSize: 18.sp,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
