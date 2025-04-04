import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_flutter/presentation/manager/color_manager.dart';

class StyleManager {
  static TextStyle headerOne() {
    return GoogleFonts.notoSans().copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 20,
      height: 1.3620833333,
      color: ColorManager.aquaDeep50,
    );
  }

  static TextStyle bodyText() {
    return GoogleFonts.notoSans().copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 14,
      height: 1.3620833333,
      color: ColorManager.white,
    );
  }

  static TextStyle title() {
    return GoogleFonts.notoSans().copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 22,
      height: 1.3620833333,
      color: ColorManager.white,
    );
  }
}
