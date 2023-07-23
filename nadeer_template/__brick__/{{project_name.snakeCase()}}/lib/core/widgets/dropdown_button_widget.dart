import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

// ignore: must_be_immutable
class DropdownButtonWidget extends StatefulWidget {
  String? x;
  final List<String> items;

  DropdownButtonWidget({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  State<DropdownButtonWidget> createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      // width:widget.width ,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border, width: 1),
        borderRadius: BorderRadius.circular(65),
      ),
      child: DropdownButton(
        style: Theme.of(context).textTheme.displaySmall,
        dropdownColor: AppColors.black,
        borderRadius: BorderRadius.circular(10),
        underline: const SizedBox.shrink(),
        hint: Text(
          'ترتيب حسب'.tr(),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        value: widget.x,
        items: widget.items.map((String item) {
          return DropdownMenuItem(
            value: item,
            child: Text(
              item,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          );
        }).toList(),
        onChanged: (String? value) {
          setState(() {
            widget.x = value;
          });
        },
      ),
    );
  }
}

class CustomDropdownFormField<T> extends StatefulWidget {
  final String hint;
  final T? initValue;
  final dynamic items;
  final void Function(T? val)? onSave;

  const CustomDropdownFormField({
    Key? key,
    required this.hint,
    required this.items,
    this.initValue,
    required this.onSave,
  }) : super(key: key);

  @override
  State<CustomDropdownFormField> createState() =>
      _CustomDropdownFormFieldState<T>();
}

class _CustomDropdownFormFieldState<T> extends State<CustomDropdownFormField> {
  T? value;

  @override
  void initState() {
    value = widget.initValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.onSave.runtimeType);
    return DropdownButtonFormField<T>(
      style: Theme.of(context).textTheme.displaySmall,
      focusColor: Colors.red,

      // dropdownColor: ColorManager.white,
      borderRadius: BorderRadius.circular(10),
      decoration: const InputDecoration(border: InputBorder.none),
      isExpanded: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      hint: Text(
        widget.hint,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      value: value,
      items: widget.items,
      onChanged: (T? changeValue) {
        value = changeValue;
      },
      onSaved: (newValue) {
        widget.onSave?.call(newValue);
      },
      // onSaved: widget.onSave,
      validator: (T? value) {
        if (value == null) {
          return "please selecet type";
        }
        return null;
      },
    );
  }
}
