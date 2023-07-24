import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../app/app.dart';
import '../widgets/custom_bottom_sheet.dart';
import 'sized_box_functions.dart';

showLoginBottomSheet() {
  final context = navContext;
  showBottomSheetWidget(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          'please_login_to_enjoy_this_feature'.tr(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        32.hh,
        Center(
          child: ElevatedButton(
            onPressed: () {
              // Navigator.of(context).pushNamed(Routes.authScreen);
            },
            child: const Text('login_').tr(),
          ),
        ),
        32.hh,
      ],
    ),
  );
}
