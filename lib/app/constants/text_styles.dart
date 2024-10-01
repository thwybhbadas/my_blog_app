import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyleConst{
  static TextStyle mediumTextStyle(Color color, double fontSize) => GoogleFonts.notoKufiArabic(
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.w600,
    decoration: TextDecoration.none,
    
      );
  static TextStyle boldTextStyle(Color color, double fontSize) => GoogleFonts.notoKufiArabic(
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.w700,
      decoration: TextDecoration.none
      );
  static TextStyle hintTextStyle(Color color) => GoogleFonts.notoKufiArabic(
        fontSize: 14,
        color:color,
        // fontWeight: FontWeight.w600,
      // decoration: TextDecoration.none
      );
  static TextStyle forgotTextStyle(Color color, double fontSize) => GoogleFonts.notoKufiArabic(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
      decoration: TextDecoration.none
      );
       static TextStyle smallTextStyle(Color color,double fontSize) => GoogleFonts.notoKufiArabic(
        color: color,
        fontSize: fontSize,
      decoration: TextDecoration.none
      );
}