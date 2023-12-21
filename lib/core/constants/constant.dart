import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

const String bookAPIBaseUrl = 'https://wolnelektury.pl/api';

class TColor {
  static Color get primary => const Color(0xffF73435);
  static Color get textprimary => const Color(0xff000000);
  static Color get background => const Color(0xffFFFFFF);
  static Color get serconday => Colors.grey;
}

TextTheme textTheme = TextTheme(
  headlineLarge: GoogleFonts.catamaran(
      fontWeight: FontWeight.w900, fontSize: 40.sp, height: 1),
  labelLarge: GoogleFonts.catamaran(
      fontWeight: FontWeight.w500, fontSize: 20.sp, height: 1),
  labelMedium: GoogleFonts.catamaran(
      fontWeight: FontWeight.w400, fontSize: 13.sp, height: 1),
);
