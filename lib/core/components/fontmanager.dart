import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
Text manropeText({
  required String text,
  Color? color,
  TextAlign? textAlign,
  double? fontSize,
  FontWeight? fontWeight,
  double? letterSpacing,
  Paint? forgroundPaint,
}) {
  return Text(
    text,
    textAlign: textAlign ?? TextAlign.start,
    style: GoogleFonts.inter(
      color: color ?? Colors.black,
      fontSize: fontSize ?? 14,
      fontWeight: fontWeight ?? FontWeight.w400,
      letterSpacing: letterSpacing ?? 2,
    ),
  );
}

TextStyle manropeTextStyle({
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
  TextAlign? textAlign,
  double? letterSpacing,
  TextStyle? textStyle,
}) {
  return GoogleFonts.inter(
    color: color ?? Colors.white,
    fontSize: fontSize ?? 14,
    fontWeight: fontWeight,
    letterSpacing: letterSpacing ?? 0.5,
    textStyle: textStyle,
  );
}

TextStyle kTextstyle({
  Color? color,
  double? fontSize,
  String? fontFamily,
  FontWeight? fontWeight,
  TextAlign? textAlign,
  double? letterSpacing,
  TextStyle? textStyle,
}) {
  return TextStyle(
    color: color ?? Colors.white,
    fontSize: fontSize ?? 14,
    fontWeight: fontWeight,
    letterSpacing: letterSpacing ?? 0.5,
  );
}
