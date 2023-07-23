import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/utils/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final Size buttonSize;
  final void Function()? onPress;
  final String buttonLabel;
  final Widget? child;
  final String? imagePath;
  final Widget? icon;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color disableColor;
  final double radius;
  final double? fontSize;
  final double? opacity;
  final Color borderColor;

  const CustomElevatedButton({
    Key? key,
    required this.buttonSize,
    required this.buttonLabel,
    this.child,
    this.icon,
    this.onPress,
    this.imagePath,
    this.backgroundColor = AppColors.primary,
    this.foregroundColor = Colors.white,
    this.disableColor = AppColors.primary,
    this.radius = 10.0,
    this.opacity = 0.5,
    this.borderColor = Colors.transparent,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double?>(0),
        minimumSize: MaterialStateProperty.all<Size>(buttonSize),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) => states.contains(MaterialState.disabled)
              ? disableColor
              : backgroundColor,
        ),
        foregroundColor: MaterialStateProperty.all<Color>(foregroundColor),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(
            color: borderColor,
            width: 1,
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
      onPressed: onPress,
      child: imagePath == null && icon == null
          ? child ??
              Text(
                buttonLabel.tr(),
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: foregroundColor,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w600),
              )
          : SizedBox(
              width: buttonSize.width,
              // width: buttonSize.width,
              child: Row(
                mainAxisAlignment: icon == null
                    ? MainAxisAlignment.spaceEvenly
                    : MainAxisAlignment.center,
                children: [
                  icon == null
                      ? Opacity(
                          opacity: opacity!,
                          child: imagePath!.split('.').last == 'svg'
                              ? SvgPicture.asset(
                                  imagePath!,
                                  width: 25.w,
                                  height: 25.h,
                                )
                              : Image.asset(
                                  imagePath!,
                                  width: 30.w,
                                  height: 30.h,
                                ),
                        )
                      : icon!,
                  // const Spacer(),
                  Text(
                    buttonLabel.tr(),
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: foregroundColor,
                        ),
                  ),
                ],
              ),
            ),
    );
  }
}
