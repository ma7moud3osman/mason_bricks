import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../app/app.dart';
import '../widgets/custom_loading_widget.dart';

void showLoadingDialog() {
  final context = navContext;
  showDialog(
    context: context,
    builder: (context) => Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Card(
            color: Colors.white,
            child: SizedBox(
              width: 85.h,
              height: 85.w,
              child: const CustomLoadingWidget(),
            ),
          )
        ],
      ),
    ),
    barrierDismissible: false,
  );
}

void disMissCurrentLoadingDialog() {
  Navigator.of(navContext).pop();
}

void showToast({
  required String msg,
  Color backgroundColor = Colors.black,
  Color textColor = Colors.white,
}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: backgroundColor,
    textColor: textColor,
    fontSize: 16.0,
  );
}
