import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/utils/app_colors.dart';

class SocialWidget extends StatefulWidget {
  final String image;
  final Color background;
  final Color? imageColor;
  final Color? textColor;
  final String? url;
  const SocialWidget({
    Key? key,
    this.url,
    required this.image,
    this.imageColor = AppColors.white,
    required this.background,
    this.textColor = AppColors.white,
  }) : super(key: key);

  @override
  State<SocialWidget> createState() => _SocialWidgetState();
}

class _SocialWidgetState extends State<SocialWidget> {
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final Uri toLaunch = Uri.parse('${widget.url}');
    return InkWell(
      onTap: () async {
        if (await canLaunchUrl(toLaunch)) {
          await _launchInBrowser(toLaunch);
        } else {
          throw 'Could not launch ${widget.url}';
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        width: 50.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: widget.background,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: SvgPicture.asset(
          widget.image,
          width: 28.w,
          height: 28.h,
          color: widget.imageColor,
        ),
      ),
    );
  }
}
