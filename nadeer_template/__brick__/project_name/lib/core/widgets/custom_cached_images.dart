import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCachedImages extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit? fit;
  final double topRadius;
  final double bottomRadius;
  const CustomCachedImages({
    Key? key,
    required this.imageUrl,
    this.width = 30,
    this.height = 30,
    this.topRadius = 10,
    this.bottomRadius = 10,
    this.fit = BoxFit.contain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(topRadius.r),
        topRight: Radius.circular(topRadius.r),
        bottomLeft: Radius.circular(bottomRadius.r),
        bottomRight: Radius.circular(bottomRadius.r),
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width.w,
        height: height.h,
        fit: fit,
        // placeholder: (context, url) => Image.asset(
        //   context.read<ThemeProvider>().isDarkMode
        //       ? AppImages.arrafWhite
        //       : AppImages.arrafGreen,
        // ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
