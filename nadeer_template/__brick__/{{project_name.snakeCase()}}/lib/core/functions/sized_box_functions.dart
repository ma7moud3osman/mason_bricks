import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension EmptyPadding on num {
  SizedBox get hh => SizedBox(
        height: toDouble().h,
      );

  SizedBox get ww => SizedBox(
        width: toDouble().w,
      );
}

extension AddPadding on Widget {
  Widget addPadding(EdgeInsets padding) => Padding(
    padding: padding,
    child: this,
  );
}