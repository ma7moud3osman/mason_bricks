import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

customDialogWidget({
  required BuildContext context,
  required String title,
  required String content,
  void Function()? onPressed,
  void Function()? cancelOnPressed,
  Widget? okWidget,
  Widget? cancelWidget,
}) {
  showDialog(
    context: context,
    builder: (ctx) => Platform.isIOS
        ? CupertinoAlertDialog(
            title: Text(
              title.tr(),
              style: Theme.of(context).textTheme.labelMedium,
            ),
            content: Text(
              content.tr(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                onPressed: onPressed,
                isDefaultAction: true,
                child: okWidget ??
                    Text(
                      "ok_".tr(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: AppColors.error),
                    ),
              ),
              CupertinoDialogAction(
                onPressed: cancelOnPressed ?? () => Navigator.pop(context),
                child: cancelWidget ??
                    Text(
                      "cancel_".tr(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
              )
            ],
          )
        : AlertDialog(
            title: Text(
              title.tr(),
              style: Theme.of(context).textTheme.labelMedium,
            ),
            content: Text(
              content.tr(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            actions: [
              TextButton(
                  onPressed: onPressed,
                  child: okWidget ??
                      Text(
                        'Ok'.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppColors.error),
                      )),
              TextButton(
                onPressed: cancelOnPressed ?? () => Navigator.pop(context),
                child: cancelWidget ??
                    Text(
                      "cancel_".tr(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
              ),
            ],
          ),
  );
}
