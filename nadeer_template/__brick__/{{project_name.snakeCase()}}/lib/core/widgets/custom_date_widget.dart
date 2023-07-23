import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_colors.dart';
import '../functions/get_date_functions.dart';
import 'custom_text_field.dart';

class CustomDateWidget extends StatefulWidget {
  final String? date;
  final String title;
  final void Function(DateTime dateTime, bool isNeedToPop) onTap;

  const CustomDateWidget({
    Key? key,
    required this.title,
    required this.date,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CustomDateWidget> createState() => _CustomDateWidgetState();
}

class _CustomDateWidgetState extends State<CustomDateWidget> {
  late final TextEditingController dateController;

  @override
  void initState() {
    dateController = TextEditingController(text: getDate(date: widget.date));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime? selectedDate;
    return CustomTextFormField(
      hintText: '',
      controller: dateController,
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'cant not be empty';
        }
        return null;
      },
      suffixIcon: const Icon(
        Icons.calendar_month_outlined,
        size: 20,
        color: AppColors.primary,
      ),
      keyboardType: TextInputType.none,
      readOnly: true,
      onTap: () => Platform.isIOS
          ? showSheet(
              context,
              child: IosDatePicker(
                initialDateTime: DateFormat('dd-MM-y', 'en_US').parse(
                  dateController.text.isEmpty
                      ? getDate(date: DateTime.now().toString())
                      : dateController.text,
                ),
                onChange: (date) => selectedDate = date,
              ),
              title: Text(
                widget.title.tr(),
                style: Theme.of(context).textTheme.labelMedium,
              ),
              message: Text(
                "${"please_select".tr()} ${widget.title.tr()}",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              onClicked: () {
                dateController.text =
                    getDate(date: (selectedDate ?? DateTime.now()).toString());
                widget.onTap(
                  selectedDate ?? DateTime.now(),
                  true,
                );
              },
            )
          : _selectDate(
              context,
              DateFormat('dd-MM-y', 'en_US').parse(
                dateController.text.isEmpty
                    ? getDate(date: DateTime.now().toString())
                    : dateController.text,
              ),
            ),
      label: '',
    );
  }

  Future<void> _selectDate(
      BuildContext context, DateTime initialDateTime) async {
    final dateNow = DateTime.now();
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: initialDateTime,
        firstDate: DateTime(dateNow.year - 80, dateNow.month, dateNow.day),
        lastDate: DateTime.now(),
        initialEntryMode: DatePickerEntryMode.calendarOnly);
    if (picked != null) {
      dateController.text = getDate(date: picked.toString());
      widget.onTap(picked, false);
    }
  }
}

class IosDatePicker extends StatelessWidget {
  final DateTime? initialDateTime;
  final void Function(DateTime dateTime) onChange;

  const IosDatePicker(
      {Key? key, required this.initialDateTime, required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: CupertinoDatePicker(
        initialDateTime: initialDateTime ?? DateTime.now(),
        minimumYear: DateTime.now().year - 80,
        maximumYear: DateTime.now().year,
        mode: CupertinoDatePickerMode.date,
        onDateTimeChanged: onChange,
      ),
    );
  }
}

void showSheet(
  BuildContext context, {
  required Widget child,
  required Widget title,
  required Widget message,
  required VoidCallback onClicked,
}) =>
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: title,
        message: message,
        actions: [
          child,
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: onClicked,
          child: const Text('done_').tr(),
        ),
      ),
    );
