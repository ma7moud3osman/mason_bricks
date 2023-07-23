import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../app/app.dart';
import '../utils/app_colors.dart';

Future<void> phoneCall({required String phone}) async {
  final context = navContext;
  Navigator.of(context).pop();
  if (await canLaunchUrl(Uri(path: phone, scheme: 'tel'))) {
    await launchUrl(Uri(path: phone, scheme: 'tel'));
  } else {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.primary,
          content: Column(
            children: const [
              Text('phoneCall'),
              Text("phoneCall isn't allow"),
            ],
          ),
        ),
      );
    }
  }
}
