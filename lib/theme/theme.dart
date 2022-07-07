import 'package:flutter/material.dart';
import 'package:flutter_suitmedia_mobile_assessment/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const TextStyle h1 = TextStyle(
    color: AppColor.dark,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle h2 = TextStyle(
    color: AppColor.dark,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle h3 = TextStyle(
    color: AppColor.dark,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle subtitle = TextStyle(
    color: AppColor.dark,
    fontSize: 10,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle title = TextStyle(
    color: AppColor.dark,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle body = TextStyle(
    color: AppColor.dark,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static ThemeData light() {
    return ThemeData(
      primaryColor: AppColor.primary,
      scaffoldBackgroundColor: Colors.white,
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        bodyText1: body,
      ),
    );
  }
}
