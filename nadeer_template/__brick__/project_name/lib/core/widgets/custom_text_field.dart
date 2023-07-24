import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final double width;
  final double radius;
  final String? label;
  final String? hintText;
  final TextDirection? hintTextDirection;
  final String? initialValue;
  final TextInputType keyboardType;
  final String? Function(String? val)? validator;
  final void Function(String? val)? onSave;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final int linesCount;
  final bool isEnable;
  final bool obscureText;
  final bool readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final TextEditingController? controller;

  const CustomTextFormField({
    super.key,
    this.width = 350,
    this.radius = 12,
    this.label,
    this.hintText,
    this.hintTextDirection,
    this.initialValue,
    this.validator,
    this.onSave,
    this.onChanged,
    required this.keyboardType,
    this.linesCount = 1,
    this.isEnable = true,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.focusNode,
    this.onTap,
    this.readOnly = false,
    // this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      child: TextFormField(
        onTap: onTap,
        readOnly: readOnly,
        initialValue: initialValue,
        controller: controller,
        style: Theme.of(context)
            .textTheme
            .headlineMedium
            ?.copyWith(color: Colors.grey.shade700),
        onChanged: onChanged,
        onSaved: onSave,
        minLines: linesCount,
        maxLines: linesCount,
        validator: validator,
        keyboardType: keyboardType,
        focusNode: focusNode,
        obscureText: obscureText,
        // autofocus:true,
        decoration: InputDecoration(
          errorMaxLines: 6,
          errorStyle: Theme.of(context)
              .inputDecorationTheme
              .errorStyle
              ?.copyWith(fontSize: 14),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          enabled: isEnable,
          labelText: label?.tr(),
          hintText: hintText?.tr(),
          hintTextDirection: hintTextDirection,
        ),
      ),
    );
  }
}
