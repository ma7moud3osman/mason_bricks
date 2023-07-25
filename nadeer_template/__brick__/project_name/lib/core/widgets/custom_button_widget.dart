import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomTextButtonWidget extends StatelessWidget {
  final String buttonName;
  final void Function()? onPressed;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final bool isIcon;
  final String? iconName;
  final double paddingHorizontal;
  final double paddingVertical;
  final double width;
  final double height;
  final double borderRadius;

  const CustomTextButtonWidget({
    Key? key,
    required this.buttonName,
    required this.onPressed,
    this.backgroundColor = AppColors.background,
    this.borderColor = Colors.transparent,
    this.textColor = Colors.white,
    this.isIcon = false,
    this.iconName,
    this.paddingHorizontal = 0,
    this.paddingVertical = 0,
    this.width = double.infinity,
    this.height = 45,
    this.borderRadius = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(
          Size(
            width,
            height,
          ),
        ),

        backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(
              color: borderColor,
            ),
          ),
        ),
      ),
      child: Text(
        buttonName,
        style: TextStyle(
          fontSize: 16,
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ).tr(),
    );
  }
}

class CustomTextIconButtonWidget extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color color;
  final Color textColor;
  final Color borderColor;
  final Widget icon;

  final double paddingHorizontal;
  final double paddingVertical;
  final double width;
  final double height;
  final double borderRadius;

  const CustomTextIconButtonWidget({
    Key? key,
    required this.text,
    required this.icon,
    required this.onPressed,
    this.color = AppColors.primary,
    this.textColor = AppColors.white,
    this.borderColor = Colors.transparent,
    this.borderRadius = 65,
    this.paddingHorizontal = 0,
    this.paddingVertical = 0,
    this.width = double.infinity,
    this.height = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(
          Size(
            width,
            height,
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(color),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(color: borderColor),
          ),
        ),
      ),
      label: Text(
        text.tr(),
        style: TextStyle(
          fontSize: 14,
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      icon: icon,
      onPressed: onPressed,
    );
  }
}
