import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../app/app.dart';
import '../functions/sized_box_functions.dart';

import '../utils/app_colors.dart';

Future<void> showBottomSheetWidget(
    {required Widget child, String? name}) async {
  final context = navContext;
  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    routeSettings: RouteSettings(name: name),
    builder: (context) => GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const HeaderBottomSheet(),
              20.hh,
              child,
            ],
          ),
        ),
      ),
    ),
  );
}

class HeaderBottomSheet extends StatelessWidget {
  const HeaderBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50.w,
          height: 5.h,
          margin: const EdgeInsets.symmetric(vertical: 16).r,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10).r,
            color: AppColors.border,
          ),
        ),
        const Divider(),
      ],
    );
  }
}
