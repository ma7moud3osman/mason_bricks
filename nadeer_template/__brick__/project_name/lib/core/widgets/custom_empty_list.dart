import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../functions/sized_box_functions.dart';
import '../utils/app_colors.dart';
import '../utils/app_images.dart';

class CustomEmptyList extends StatelessWidget {
  final String text;
  const CustomEmptyList({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.boxIcon,
            color: AppColors.text1,
            width: 120,
          ),
          10.hh,
          Text(text).tr(),
        ],
      ),
    );
  }
}
