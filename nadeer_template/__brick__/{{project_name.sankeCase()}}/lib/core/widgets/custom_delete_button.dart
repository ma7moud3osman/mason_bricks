import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'custom_dialog_widget.dart';

class CustomDeleteButton extends StatelessWidget {
  final void Function()? onPressed;
  const CustomDeleteButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => customDialogWidget(
        context: context,
        title: "delete_",
        content: "are_you_sure_you_want_to_delete_this_item?",
        okWidget: const Text("delete_").tr(),
        onPressed: onPressed,
        cancelWidget: const Text("cancel_").tr(),
        cancelOnPressed: () => Navigator.of(context).pop(),
      ),
      icon: const Icon(
        Icons.delete,
        color: AppColors.error,
        size: 20,
      ),
    );
  }
}
