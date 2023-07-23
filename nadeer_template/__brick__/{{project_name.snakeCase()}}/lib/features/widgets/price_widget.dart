import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/functions/sized_box_functions.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_language.dart';

class PriceWidget extends StatelessWidget {
  final double price;
  final double? salePrice;
  final Color color;
  final Color colorSAR;
  final double fontSizePrcie;
  final double fontSizeSAR;

  const PriceWidget({
    Key? key,
    required this.price,
    this.salePrice,
    this.color = AppColors.text2,
    this.colorSAR = AppColors.text2,
    this.fontSizePrcie = 0,
    this.fontSizeSAR = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          if (salePrice != null) ...[
            TextSpan(
              text: "$price",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: color,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.lineThrough,
                    fontSize: fontSizePrcie > 0 ? fontSizePrcie : 16.sp,
                  ),
            ),
            WidgetSpan(child: context.locale == ARABIC_LOCAL ? 2.ww : 5.ww),
          ],
          TextSpan(
            text: salePrice == null ? "$price" : "$salePrice",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: salePrice == null ? color : AppColors.secondary,
                fontWeight: FontWeight.w700,
                fontSize: fontSizePrcie > 0 ? fontSizePrcie : 16.sp),
          ),
          WidgetSpan(
            child: context.locale == ARABIC_LOCAL && salePrice != null
                ? 5.ww
                : 2.ww,
          ),
          TextSpan(
            text: 'sar_'.tr(),
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: color, fontSize: fontSizeSAR > 0 ? fontSizeSAR : 9.sp),
          ),
        ],
      ),
    );
  }
}
