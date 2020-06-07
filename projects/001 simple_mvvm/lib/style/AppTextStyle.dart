import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_mvvm/style/AppFontSize.dart';

class AppTextStyle{
static TextStyle header1(BuildContext context, Color color) {
    return GoogleFonts.alef(
      fontSize: AppFontSizes.largest,
     textStyle: 
    TextStyle(
        color: color));
  }
}