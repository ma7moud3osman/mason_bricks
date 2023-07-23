import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_strings.dart';


class CustomErrorWidget extends StatelessWidget {
  final VoidCallback? onPress;
  const CustomErrorWidget({Key? key, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(
          child: Icon(
            Icons.warning_amber_rounded,
            size: 150,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            AppStrings.somethingWentWrong,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        Text(
          AppStrings.tryAgain,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        Container(
          height: 55,
          width: 207.w,
          margin: const EdgeInsets.symmetric(vertical: 15),
          child: ElevatedButton(
            child: const Text(
              AppStrings.reloadScreen,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            onPressed: () {
              if (onPress != null) {
                onPress!();
              }
            },
          ),
        )
      ],
    );
  }
}
