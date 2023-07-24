import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/functions/sized_box_functions.dart';
import '../user_feature/presentation/provider/user_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_images.dart';
import '../../core/routes/app_routes.dart';
import 'drawer_item_widget.dart';

class CustomDrawerWidget extends StatefulWidget {
  final int selectedIndex;
  final void Function(int index) changeNavigatorIndex;

  const CustomDrawerWidget({
    Key? key,
    required this.changeNavigatorIndex,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  State<CustomDrawerWidget> createState() => _CustomDrawerWidgetState();
}

class _CustomDrawerWidgetState extends State<CustomDrawerWidget> {
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width,
      backgroundColor: AppColors.white,
      elevation: 25,
      child: Row(
        children: [
          ColoredBox(
            color: const Color(0xffF1F5F9),
            child: SizedBox(
              width: 100.w,
              child: Column(
                children: [
                  50.hh,
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 30.r,
                    ),
                  ),
                  const Spacer(),
                  Column(
                    children: List.generate(
                      drawerCategoryItemModelList.length,
                      (index) => Column(
                        children: [
                          DrawerCategoryItem(
                            onTap: () {
                              widget.changeNavigatorIndex(index);
                              Navigator.of(context).pop();
                            },
                            index: index,
                            isSelected: widget.selectedIndex == index,
                            imagePath:
                                drawerCategoryItemModelList[index].imagePath,
                          ),
                          25.hh,
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: context.read<UserProvider>().logOut,
                    icon: Icon(
                      Icons.login_outlined,
                      size: 30.r,
                      color: AppColors.favorite,
                    ),
                  ),
                  50.hh,
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                50.hh,
                context.read<UserProvider>().isAuth
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "${context.read<UserProvider>().currentUser?.firstName} ${context.read<UserProvider>().currentUser?.lastName}",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              7.hh,
                              SizedBox(
                                width: 200.w,
                                child: Text(
                                  '${context.read<UserProvider>().currentUser?.email}',
                                  maxLines: 1,
                                  textAlign: TextAlign.end,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                          fontSize: 14,
                                          overflow: TextOverflow.ellipsis),
                                ),
                              ),
                            ],
                          ),
                          context
                                      .read<UserProvider>()
                                      .currentUser
                                      ?.profileImageUri ==
                                  null
                              ? CircleAvatar(
                                  backgroundImage:
                                      const AssetImage(AppImages.profileIcon),
                                  backgroundColor: Colors.transparent,
                                  radius: 25.r,
                                )
                              : CircleAvatar(
                                  backgroundImage: CachedNetworkImageProvider(
                                    "${context.read<UserProvider>().currentUser?.profileImageUri}",
                                  ),
                                  backgroundColor: Colors.transparent,
                                  radius: 25.r,
                                ),
                        ],
                      )
                    : const SizedBox.shrink(),
                Expanded(
                  child: Column(
                    children: [
                      const Spacer(flex: 3),
                      ...allItemModels
                          .where((element) =>
                              element.parentIndex == selectedCategory)
                          .map(
                            (e) => TweenAnimationBuilder<double>(
                              builder: (context, value, child) {
                                return Opacity(
                                  key: ValueKey(e),
                                  opacity: value,
                                  child: Column(
                                    children: [
                                      DrawerItem(
                                        itemModel: e,
                                      ),
                                      10.hh,
                                    ],
                                  ),
                                );
                              },
                              tween: Tween(begin: 0, end: 1),
                              duration: const Duration(
                                milliseconds: 500,
                              ),
                            ),
                          )
                          .toList(),
                      const Spacer(flex: 7),
                    ],
                  ),
                ),
                50.hh,
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerCategoryItem extends StatelessWidget {
  final bool isSelected;
  final int index;
  final void Function() onTap;
  final String imagePath;

  const DrawerCategoryItem({
    Key? key,
    required this.isSelected,
    required this.index,
    required this.onTap,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x61334155),
            blurRadius: 15,
            spreadRadius: -10,
          ),
        ],
      ),
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: onTap,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: InkWell(
          child: SvgPicture.asset(
            imagePath,
            height: 30.h,
            width: 30.h,
            color: isSelected ? AppColors.primary : Colors.black,
          ),
        ),
      ),
    );
  }
}

class DrawerCategoryItemModel {
  final String imagePath;

  const DrawerCategoryItemModel({
    required this.imagePath,
  });
}

class DrawerItemModel {
  final String title;
  final String icon;

  final String screenName;
  final int parentIndex;

  const DrawerItemModel({
    Key? key,
    required this.title,
    required this.icon,
    required this.screenName,
    required this.parentIndex,
  });
}

const List<DrawerCategoryItemModel> drawerCategoryItemModelList = [
  DrawerCategoryItemModel(imagePath: AppImages.homeIcon),
  DrawerCategoryItemModel(imagePath: AppImages.exploreIcon),
  DrawerCategoryItemModel(imagePath: AppImages.cartIcon),
  DrawerCategoryItemModel(imagePath: AppImages.orderIcon),
  DrawerCategoryItemModel(imagePath: AppImages.accountIcon),
];

List<DrawerItemModel> allItemModels = [
  DrawerItemModel(
    title: 'about_'.tr(),
    icon: AppImages.aboutIcon,
    screenName: Routes.aboutRoute,
    parentIndex: 0,
  ),
  // const DrawerItemModel(
  //   title: 'STORES',
  //   icon: AppImages.storeIcon,
  //   screenName: Routes.storeRoute,
  //   parentIndex: 0,
  // ),
  DrawerItemModel(
    title: 'terms_'.tr(),
    icon: AppImages.addressIcon,
    screenName: Routes.termsRoute,
    parentIndex: 0,
  ),
  DrawerItemModel(
    title: 'contact_us'.tr(),
    icon: AppImages.phoneIcon,
    screenName: Routes.contactUsRoute,
    parentIndex: 0,
  ),
];
