import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomDropdownFormField extends StatefulWidget {
  final String title;
  final String hint;
  final String? initValue;
  final List<String> items;
  final void Function(String? val)? onSave;

  const CustomDropdownFormField({
    Key? key,
    required this.title,
    required this.hint,
    required this.items,
    this.initValue,
    required this.onSave,
  }) : super(key: key);

  @override
  State<CustomDropdownFormField> createState() =>
      _CustomDropdownFormFieldState();
}

class _CustomDropdownFormFieldState extends State<CustomDropdownFormField> {
  String? value;
  @override
  void initState() {
    value = widget.initValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(7.0),
          child: Text(
            widget.title.tr(),
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        DropdownButtonFormField<String>(
          borderRadius: BorderRadius.circular(15),
          style: Theme.of(context).textTheme.displaySmall,
          dropdownColor: AppColors.secondary,
          hint: Text(
            widget.hint,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          value: value,
          items: widget.items.map((String item) {
            return DropdownMenuItem(
              value: item,
              child: Text(
                item,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            );
          }).toList(),
          onChanged: (String? changeValue) {
            value = changeValue;
          },
          onSaved: widget.onSave,
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return "please selecet type";
            }
            return null;
          },
        ),
      ],
    );
  }
}
