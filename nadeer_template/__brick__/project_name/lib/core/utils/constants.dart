import 'package:flutter/material.dart';

import '../../features/widgets/account_widget.dart';
import '../app/app.dart';
import '../functions/show_language_sheet.dart';
import '../routes/app_routes.dart';
import 'app_enums.dart';
import 'app_images.dart';

class Constants {
  static const String empty = "";
  static const bool statusEmpty = false;
  static String token = "SEND TOKEN HERE";
  static const int zero = 0;
  static const int apiTimeOut = 60000;

  //---Twitter config
  static String twitterApiKey = 'CBquvp42VC7Or7sUaZe9s09TL';
  static String twitterApiSecretKey =
      'mDnkK8gGvz5HnrX7qWANqo0jCFKZ3Z6KasGtg4HhzeGF1pT5H7';
  static String twitterRedirectURI = 'example://';

  static List<AccountItem> accountList = [
    AccountItem(
      roleList: [Roles.user],
      image: AppImages.favoriteIcon,
      title: 'favorite_',
      onTap: () => Navigator.of(navContext).pushNamed(Routes.favoriteRoute),
    ),
    AccountItem(
      roleList: [Roles.user, Roles.admin, Roles.driver, Roles.fulfillment],
      image: AppImages.myDetailsIcon,
      title: 'my_details',
      onTap: () => Navigator.of(navContext).pushNamed(Routes.myDetailsRoute),
    ),

    AccountItem(
      roleList: [Roles.user],
      image: AppImages.myDetailsIcon,
      title: 'my_wallet',
      icon: const Icon(Icons.account_balance_wallet_outlined),
      onTap: () =>
          Navigator.of(navContext).pushNamed(Routes.myWalletScreenRoute),
    ),
    AccountItem(
      roleList: [Roles.admin],
      image: AppImages.myDetailsIcon,
      title: 'region_',
      icon: const Icon(Icons.account_balance_wallet_outlined),
      onTap: () => Navigator.of(navContext).pushNamed(Routes.regionScreen),
    ),

    const AccountItem(
      roleList: [
        Roles.user,
        Roles.admin,
        Roles.driver,
        Roles.fulfillment,
        Roles.guest
      ],
      image: AppImages.helpIcon,
      title: 'change_language',
      onTap: showLanguageBottomSheet,
    ),
    AccountItem(
      roleList: [Roles.user, Roles.admin, Roles.driver, Roles.fulfillment],
      image: AppImages.updatePasswordIcon,
      title: 'update_password',
      onTap: () =>
          Navigator.of(navContext).pushNamed(Routes.updatePasswordRoute),
    ),
    AccountItem(
      roleList: [Roles.user],
      image: AppImages.addressIcon,
      title: 'addresses_',
      onTap: () =>
          Navigator.of(navContext).pushNamed(Routes.deliverAddressRoute),
    ),

    AccountItem(
      roleList: [Roles.admin],
      image: AppImages.accountIcon,
      title: "get_account",
      onTap: () => Navigator.of(navContext).pushNamed(Routes.adminUserScreen),
    ),
    AccountItem(
      roleList: [Roles.admin],
      image: AppImages.couponIcon,
      title: "coupons_",
      onTap: () =>
          Navigator.of(navContext).pushNamed(Routes.adminCouponsScreen),
    ),
    AccountItem(
      roleList: [
        Roles.admin,
      ],
      title: "wallets_transfer",
      image: AppImages.myDetailsIcon,
      icon: const Icon(Icons.account_balance_wallet_outlined),
      onTap: () => Navigator.of(navContext).pushNamed(Routes.walletsScreen),
    ),
    AccountItem(
      roleList: [Roles.admin],
      image: AppImages.settingsIcon,
      title: "app_config",
      onTap: () => Navigator.of(navContext).pushNamed(Routes.appConfigRoute),
    ),
    // AccountItem(
    //   roleList: [Roles.user],
    //   image: AppImages.helpIcon,
    //   title: 'help_',
    //   onTap: () => Navigator.of(navContext)
    //       .pushNamed(Routes.helpRoute),
    // ),
    AccountItem(
      roleList: [Roles.user, Roles.driver, Roles.fulfillment, Roles.guest],
      image: AppImages.phoneIcon,
      title: 'contact_us',
      onTap: () => Navigator.of(navContext).pushNamed(Routes.contactUsRoute),
    ),

    AccountItem(
      roleList: [Roles.guest, Roles.user],
      image: AppImages.aboutIcon,
      title: 'about_',
      onTap: () => Navigator.of(navContext).pushNamed(Routes.aboutRoute),
    ),
  ];
}
