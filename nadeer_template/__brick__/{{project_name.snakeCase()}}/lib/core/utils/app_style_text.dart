import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_font.dart';

TextStyle _getTextStyle(
    double fontSize,
    FontWeight fontWeight,
    Color color,
    double? letterSpacing,
    ) {
  return GoogleFonts.almarai(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    letterSpacing: letterSpacing,
  );
}

// regular style
TextStyle getRegularStyle(
    {double? fontSize, required Color color, double? letterSpacing}) {
  return _getTextStyle(
    fontSize ?? FontSize.s12,
    FontWeightManager.regular,
    color,
    letterSpacing,
  );
}

// medium style
TextStyle getMediumStyle(
    {double? fontSize, required Color color, double? letterSpacing}) {
  return _getTextStyle(
    fontSize ?? FontSize.s12,
    FontWeightManager.medium,
    color,
    letterSpacing,
  );
}

// medium style

TextStyle getLightStyle(
    {double? fontSize, required Color color, double? letterSpacing}) {
  return _getTextStyle(
    fontSize ?? FontSize.s12,
    FontWeightManager.light,
    color,
    letterSpacing,
  );
}

// semibold style
TextStyle getSemiBoldStyle({
  double? fontSize,
  required Color color,
  double? letterSpacing,
}) {
  return _getTextStyle(
    fontSize ?? FontSize.s12,
    FontWeightManager.semiBold,
    color,
    letterSpacing,
  );
}

// bold style
TextStyle getBoldStyle(
    {double? fontSize, required Color color, double? letterSpacing}) {
  return _getTextStyle(
    fontSize ?? FontSize.s12,
    FontWeightManager.bold,
    color,
    letterSpacing,
  );
}
