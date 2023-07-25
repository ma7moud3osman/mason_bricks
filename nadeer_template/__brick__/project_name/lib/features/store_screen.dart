import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import '../core/functions/sized_box_functions.dart';

import '../core/utils/app_colors.dart';
import '../core/utils/app_images.dart';
import '../core/widgets/custom_cached_images.dart';
import 'widgets/header_about_widget.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StoreScreen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const CustomCachedImages(
                    imageUrl:
                        'https://growmark.mobius.studio/assets/img/other/storefront-1-768x512.avif',
                    width: double.infinity,
                    fit: BoxFit.cover,
                    height: 220,
                  ),
                  const HeaderAboutWidget(text: 'NY Downtown Store'),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppImages.addressIcon,
                        height: 25.h,
                        width: 25.w,
                        color: Colors.black,
                      ),
                      8.ww,
                      Text(
                        '8912 William Street Bronx, NY 10468',
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall
                            ?.copyWith(color: AppColors.black),
                      ),
                    ],
                  ),
                  16.hh,
                  Row(
                    children: [
                      const TagWidget(
                        text: 'Dried Spices',
                        textColor: AppColors.black,
                        background: Color(0xffE9A23B),
                      ),
                      8.ww,
                      const TagWidget(
                        text: 'Vegetables',
                        background: Color(0xff2F6C78),
                      ),
                      8.ww,
                      const TagWidget(
                        text: 'Fruits',
                        background: Color(0xffC7382E),
                      ),
                    ],
                  ),
                  16.hh,
                  Text(
                    'As the weather was fine, they had a pleasant walk of about half a mile across the park. Every park has its beauty and its prospects; and Elizabeth saw much to be pleased with, though she could not be in such raptures.',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(wordSpacing: 2, height: 1.4),
                  ),
                  24.hh,
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppImages.myLocationIcon,
                        width: 20,
                        height: 20,
                      ),
                      8.ww,
                      Text(
                        'Distance: 10 km',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(color: AppColors.text1),
                      ),
                      const Spacer(),
                      TextButton.icon(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) => AppColors.primary,
                          ),
                        ),
                        onPressed: () {},
                        label: SvgPicture.asset(
                          AppImages.mapsIcon,
                          width: 20,
                          height: 20,
                          color: Colors.white,
                        ),
                        icon: Text(
                          'Go',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  12.hh,
                  const Divider()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const CustomCachedImages(
                    imageUrl:
                        'https://growmark.mobius.studio/assets/img/other/storefront-3-768x512.avif',
                    width: double.infinity,
                    fit: BoxFit.cover,
                    height: 220,
                  ),
                  const HeaderAboutWidget(text: 'Levittown Store'),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppImages.addressIcon,
                        height: 25.h,
                        width: 25.w,
                        color: Colors.black,
                      ),
                      8.ww,
                      Expanded(
                        child: Text(
                          'Home375 Riverside Street Levittown, NY 11756',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(color: AppColors.black),
                        ),
                      ),
                    ],
                  ),
                  16.hh,
                  Row(
                    children: [
                      const TagWidget(
                        text: 'Dried Spices',
                        textColor: AppColors.black,
                        background: Color(0xffE9A23B),
                      ),
                      8.ww,
                      const TagWidget(
                        text: 'Vegetables',
                        background: Color(0xff2F6C78),
                      ),
                      8.ww,
                      const TagWidget(
                        text: 'Fruits',
                        background: Color(0xffC7382E),
                      ),
                    ],
                  ),
                  16.hh,
                  Text(
                    'As the weather was fine, they had a pleasant walk of about half a mile across the park. Every park has its beauty and its prospects; and Elizabeth saw much to be pleased with, though she could not be in such raptures.',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(wordSpacing: 2, height: 1.4),
                  ),
                  24.hh,
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppImages.myLocationIcon,
                        width: 20,
                        height: 20,
                      ),
                      8.ww,
                      Text(
                        'Distance: 10 km',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(color: AppColors.text1),
                      ),
                      const Spacer(),
                      TextButton.icon(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) => AppColors.primary,
                          ),
                        ),
                        onPressed: () {},
                        label: SvgPicture.asset(
                          AppImages.mapsIcon,
                          width: 20,
                          height: 20,
                          color: Colors.white,
                        ),
                        icon: Text(
                          'Go',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  12.hh,
                  const Divider()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TagWidget extends StatelessWidget {
  final String text;
  final Color background;
  final Color? textColor;
  const TagWidget({
    Key? key,
    required this.text,
    required this.background,
    this.textColor = AppColors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: background,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(color: textColor, fontSize: 13),
      ),
    );
  }
}
