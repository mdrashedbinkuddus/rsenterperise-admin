// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FlutterFlowTheme {
  static FlutterFlowTheme of(BuildContext context) => LightModeTheme();

  Color primaryColor;
  Color secondaryColor;
  Color tertiaryColor;
  Color alternate;
  Color primaryBackground;
  Color secondaryBackground;
  Color primaryText;
  Color secondaryText;

  Color primaryBtnText;
  Color lineColor;
  Color accent;
  Color accentSecond;
  Color accentThird;
  Color negativeOne;
  Color negativeTwo;
  Color buttonTextColor;

  TextStyle get title1 => GoogleFonts.getFont(
        'Source Sans Pro',
        color: primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 36,
      );
  TextStyle get title2 => GoogleFonts.getFont(
        'Source Sans Pro',
        color: secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 28,
      );
  TextStyle get title3 => GoogleFonts.getFont(
        'Source Sans Pro',
        color: primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 24,
      );
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Source Sans Pro',
        color: primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 24,
      );
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Source Sans Pro',
        color: secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 20,
      );
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Source Sans Pro',
        color: primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 18,
      );
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Source Sans Pro',
        color: secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      );
}

class LightModeTheme extends FlutterFlowTheme {
  Color primaryColor = const Color(0xFF4510AD);
  Color secondaryColor = const Color(0xFF5D21D2);
  Color tertiaryColor = const Color(0xFF8646F8);
  Color alternate = const Color(0xFFA97CF8);
  Color primaryBackground = const Color(0xFFE9EDF1);
  Color secondaryBackground = const Color(0xFFF5F7FA);
  Color primaryText = const Color(0xFF18212A);
  Color secondaryText = const Color(0xFF212D38);

  Color primaryBtnText = Color(0xFF000000);
  Color lineColor = Color(0xFFA8A8A8);
  Color accent = Color(0xFF0079E0);
  Color accentSecond = Color(0xFF008BFF);
  Color accentThird = Color(0xFFE3F1FD);
  Color negativeOne = Color(0xFFEB1600);
  Color negativeTwo = Color(0xFFFC1A1A);
  Color buttonTextColor = Color(0xFFFFFFFF);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String fontFamily,
    Color color,
    double fontSize,
    FontWeight fontWeight,
    FontStyle fontStyle,
    bool useGoogleFonts = true,
    TextDecoration decoration,
    double lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
