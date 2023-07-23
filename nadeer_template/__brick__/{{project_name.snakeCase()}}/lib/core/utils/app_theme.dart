import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'app_font.dart';
import 'app_language.dart';
import 'app_style_text.dart';

ThemeData getAppTheme(BuildContext context, bool isDark) {
  final textTheme = Theme.of(context).textTheme;
  return ThemeData(
      // useMaterial3: true,
      // colorScheme: ColorScheme.highContrastLight(),
      // main colors
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        elevation: 0,
        selectedLabelStyle: getRegularStyle(
          color: AppColors.primary,
          fontSize: 12,
        ),
        unselectedLabelStyle: const TextStyle(
          color: AppColors.primary,
          fontSize: 12,
        ),
        unselectedItemColor: Colors.grey,
        selectedItemColor: AppColors.primary,
        type: BottomNavigationBarType.fixed,
      ),
      primaryColor: AppColors.primary,
      primaryColorLight: AppColors.primary,
      primaryColorDark: AppColors.primary,
      disabledColor: AppColors.primary,
      splashColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      // ripple effect color
      dividerTheme: const DividerThemeData(
        color: AppColors.divider,
        thickness: 1.2,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        elevation: 0,
        backgroundColor: AppColors.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
      ),
      cardTheme: CardTheme(
        color: AppColors.white,
        shadowColor: const Color.fromRGBO(0, 0, 0, 0.03),
        // shadowColor: AppColors.primary.withOpacity(0.8),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(
            color: Colors.grey.shade300,
            // color: ColorManager.white.withOpacity(0.2),
          ),
        ),
        clipBehavior: Clip.antiAlias,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
      ),
      expansionTileTheme: const ExpansionTileThemeData(
        textColor: AppColors.primary,
        iconColor: AppColors.primary,
        childrenPadding: EdgeInsets.all(8),
        collapsedTextColor: AppColors.text,
      ),
      tabBarTheme: TabBarTheme(
        dividerColor: AppColors.primary,
        indicatorColor: AppColors.white,
        labelColor: AppColors.text,
        labelStyle: getBoldStyle(
          color: AppColors.primary,
          fontSize: FontSize.s14,
        ),
        unselectedLabelColor: AppColors.text,
        unselectedLabelStyle: getRegularStyle(
          color: AppColors.white,
          fontSize: FontSize.s14,
        ),
      ),
      listTileTheme: const ListTileThemeData(
        visualDensity: VisualDensity(horizontal: -4, vertical: -4),
        minVerticalPadding: 1,
        minLeadingWidth: 0,
      ),
      // app bar theme
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        shadowColor: AppColors.white,
        iconTheme: const IconThemeData(color: AppColors.primary),
        backgroundColor: MaterialStateColor.resolveWith(
          (states) {
            if (states.contains(MaterialState.scrolledUnder)) {
              return Colors.white;
            }
            return Colors.white;
          },
        ),
        titleTextStyle: Theme.of(context).textTheme.titleMedium,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      // button theme
      buttonTheme: const ButtonThemeData(
          shape: StadiumBorder(),
          disabledColor: AppColors.primary,
          buttonColor: AppColors.primary,
          splashColor: AppColors.primary),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          iconColor: MaterialStateColor.resolveWith(
            (states) {
              if (states.contains(MaterialState.focused)) {
                return AppColors.primary;
              }
              return Colors.grey.shade400;
            },
          ),
        ),
      ),
      // elevated button them
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle:
              getRegularStyle(color: AppColors.white, fontSize: FontSize.s17),
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      textTheme: GoogleFonts.almaraiTextTheme(textTheme).copyWith(
        displayLarge: getBoldStyle(
          color: AppColors.primary,
          fontSize: FontSize.s18,
          letterSpacing: context.locale == ARABIC_LOCAL ? 0 : 0.5,
        ),
        displayMedium: getBoldStyle(
          color: AppColors.primary,
          fontSize: FontSize.s16,
          letterSpacing: context.locale == ARABIC_LOCAL ? 0 : 0.5,
        ),
        displaySmall: getBoldStyle(
          color: AppColors.primary,
          fontSize: FontSize.s14,
          letterSpacing: context.locale == ARABIC_LOCAL ? 0 : 0.5,
        ),
        headlineLarge: getSemiBoldStyle(
          color: AppColors.primary,
          fontSize: FontSize.s18,
          letterSpacing: context.locale == ARABIC_LOCAL ? 0 : 0.5,
        ),
        headlineMedium: getSemiBoldStyle(
          color: AppColors.primary,
          fontSize: FontSize.s16,
          letterSpacing: context.locale == ARABIC_LOCAL ? 0 : 0.5,
        ),
        headlineSmall: getSemiBoldStyle(
          color: AppColors.primary,
          fontSize: FontSize.s14,
          letterSpacing: context.locale == ARABIC_LOCAL ? 0 : 0.5,
        ),
        titleLarge: getSemiBoldStyle(
          color: AppColors.text,
          fontSize: FontSize.s18,
          letterSpacing: context.locale == ARABIC_LOCAL ? 0 : 0.5,
        ),
        titleMedium: getSemiBoldStyle(
          color: AppColors.text,
          fontSize: FontSize.s16,
          letterSpacing: context.locale == ARABIC_LOCAL ? 0 : 0.5,
        ),
        titleSmall: getSemiBoldStyle(
          color: AppColors.text,
          fontSize: FontSize.s14,
          letterSpacing: context.locale == ARABIC_LOCAL ? 0 : 0.5,
        ),
        labelLarge: getMediumStyle(
          color: AppColors.text,
          fontSize: FontSize.s18,
          letterSpacing: context.locale == ARABIC_LOCAL ? 0 : 0.5,
        ),
        labelMedium: getMediumStyle(
          color: AppColors.text,
          fontSize: FontSize.s16,
          letterSpacing: context.locale == ARABIC_LOCAL ? 0 : 0.5,
        ),
        labelSmall: getMediumStyle(
          color: AppColors.text,
          fontSize: FontSize.s14,
          letterSpacing: context.locale == ARABIC_LOCAL ? 0 : 0.3,
        ),
        bodyLarge: getRegularStyle(
          color: AppColors.text,
          fontSize: FontSize.s18,
          letterSpacing: context.locale == ARABIC_LOCAL ? 0 : 0.5,
        ),
        bodyMedium: getRegularStyle(
          color: AppColors.text,
          fontSize: FontSize.s16,
          letterSpacing: context.locale == ARABIC_LOCAL ? 0 : 0.5,
        ),
        bodySmall: getRegularStyle(
          color: AppColors.text,
          fontSize: FontSize.s14,
          letterSpacing: context.locale == ARABIC_LOCAL ? 0 : 0.5,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(AppColors.primary),
          backgroundColor: MaterialStateProperty.all(AppColors.white),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12.r),
              ),
            ),
          ),
          elevation: MaterialStateProperty.all(1),
          fixedSize: MaterialStateProperty.all(
            Size(120.w, 40.h),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        prefixIconColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.focused)) {
            return AppColors.primary;
          }
          return Colors.grey.shade400;
        }),
        hintStyle: getRegularStyle(color: Colors.grey.shade400, fontSize: 14),

        labelStyle: MaterialStateTextStyle.resolveWith(
          (states) {
            if (states.contains(MaterialState.focused)) {
              return getMediumStyle(color: AppColors.primary, fontSize: 16);
            }
            return getMediumStyle(color: Colors.grey.shade400, fontSize: 16);
          },
        ),
        floatingLabelStyle: MaterialStateTextStyle.resolveWith(
          (states) {
            if (states.contains(MaterialState.focused)) {
              return getMediumStyle(color: AppColors.primary, fontSize: 16);
            }
            return getMediumStyle(color: Colors.grey.shade400, fontSize: 16);
          },
        ),
        errorStyle: getRegularStyle(color: AppColors.error, fontSize: 12),
        fillColor: AppColors.white,
        filled: true,
        // enabled border style
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.border,
            width: 1.5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(12.r),
          ),
        ),

        // focused border style
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 1.5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(12.r),
          ),
        ),
        // error border style
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.error,
            width: 1.5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(12.r),
          ),
        ),
        // focused border style
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.error,
            width: 1.5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(12.r),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Colors.white,
        elevation: 25,
      ));
}
