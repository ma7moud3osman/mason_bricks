import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app/app.dart';
import '../utils/app_colors.dart';

void showDialogMethod({
  required Widget content,
  String title = '',
}) {
  showDialog(
    context: navContext,
    builder: (context) => Platform.isAndroid
        ? AlertDialog(
            title: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            content: content,
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  textStyle: Theme.of(context).textTheme.titleLarge,
                ),
                child: const Text('Ok'),
              )
            ],
          )
        : CupertinoAlertDialog(
            title: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            content: content,
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  textStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Text(
                  'ok_'.tr(),
                  style: const TextStyle(
                    color: AppColors.black,
                  ),
                ),
              )
            ],
          ),
  );
}
