import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/app_language.dart';
import 'custom_drawer_widget.dart';

class DrawerItem extends StatelessWidget {
  final DrawerItemModel itemModel;

  const DrawerItem({
    Key? key,
    required this.itemModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(itemModel.screenName),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              width: 30.w,
              child: SvgPicture.asset(
                itemModel.icon,
                height: 25.h,
                width: 25.w,
                color: const Color(0xff758099),
              ),
            ),
            SizedBox(
              width: 25.w,
            ),
            Transform.translate(
              offset: Offset(context.locale == ARABIC_LOCAL ? 5 : -5, 0),
              child: Text(
                itemModel.title.tr(),
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: const Color(
                        0xff030303,
                      ),
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
