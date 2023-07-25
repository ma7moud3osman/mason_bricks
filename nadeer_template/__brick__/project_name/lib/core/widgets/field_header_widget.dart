import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../functions/sized_box_functions.dart';
import '../utils/app_colors.dart';

class FieldHeaderWidget extends StatelessWidget {
  final String title;
  final bool isRequired;
  const FieldHeaderWidget({
    super.key,
    required this.title,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: AppColors.text2),
        ).tr(),
        5.ww,
        if (isRequired)
          Text(
            "*",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColors.error),
          ),
      ],
    ).addPadding(
      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
    );
  }
}
