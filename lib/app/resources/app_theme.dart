import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@immutable
class AppTheme extends ThemeExtension<AppTheme> {
  final TextStyle lato8w400;
  final TextStyle lato12w400;
  final TextStyle lato14w400;
  final TextStyle lato16w400;
  final TextStyle lato20w400;

  final TextStyle lato12w500;

  final TextStyle lato14w600;
  final TextStyle lato16w600;
  final TextStyle lato20w600;

  final TextStyle lato12w700;
  final TextStyle lato16w700;

  final TextStyle lato32w700;

  final TextStyle lato40w700;

  final Color white;
  final Color black;
  final Color neutralColor;

  const AppTheme({
    required this.lato8w400,
    required this.lato12w400,
    required this.lato14w400,
    required this.lato16w400,
    required this.lato20w400,
    required this.lato12w500,
    required this.lato14w600,
    required this.lato16w600,
    required this.lato20w600,
    required this.lato12w700,
    required this.lato16w700,
    required this.lato32w700,
    required this.lato40w700,
    required this.white,
    required this.black,
    required this.neutralColor,
  });

  @override
  ThemeExtension<AppTheme> lerp(covariant ThemeExtension<AppTheme>? other, double t) {
    if (other is! AppTheme) {
      return this;
    }
    return AppTheme(
      lato8w400: TextStyle.lerp(lato8w400, other.lato8w400, t)!,
      lato12w400: TextStyle.lerp(lato12w400, other.lato12w400, t)!,
      lato14w400: TextStyle.lerp(lato14w400, other.lato14w400, t)!,
      lato16w400: TextStyle.lerp(lato16w400, other.lato16w400, t)!,
      lato20w400: TextStyle.lerp(lato20w400, other.lato20w400, t)!,
      lato12w500: TextStyle.lerp(lato12w500, other.lato12w500, t)!,
      lato14w600: TextStyle.lerp(lato14w600, other.lato14w600, t)!,
      lato16w600: TextStyle.lerp(lato16w600, other.lato16w600, t)!,
      lato20w600: TextStyle.lerp(lato20w600, other.lato20w600, t)!,
      lato12w700: TextStyle.lerp(lato12w700, other.lato12w700, t)!,
      lato16w700: TextStyle.lerp(lato16w700, other.lato16w700, t)!,
      lato32w700: TextStyle.lerp(lato32w700, other.lato32w700, t)!,
      lato40w700: TextStyle.lerp(lato40w700, other.lato40w700, t)!,
      white: Color.lerp(white, other.white, t)!,
      black: Color.lerp(black, other.black, t)!,
      neutralColor: Color.lerp(neutralColor, other.neutralColor, t)!,
    );
  }

  static final light = AppTheme(
    // Lato Display
    lato8w400: TextStyle(fontFamily: 'Lato', fontSize: 8.sp, fontWeight: FontWeight.w400),
    lato12w400: TextStyle(fontFamily: 'Lato', fontSize: 12.sp, fontWeight: FontWeight.w400),
    lato14w400: TextStyle(fontFamily: 'Lato', fontSize: 14.sp, fontWeight: FontWeight.w400),
    lato16w400: TextStyle(fontFamily: 'Lato', fontSize: 16.sp, fontWeight: FontWeight.w400),
    lato20w400: TextStyle(fontFamily: 'Lato', fontSize: 20.sp, fontWeight: FontWeight.w400),
    lato12w500: TextStyle(fontFamily: 'Lato', fontSize: 12.sp, fontWeight: FontWeight.w500),
    lato14w600: TextStyle(fontFamily: 'Lato', fontSize: 14.sp, fontWeight: FontWeight.w600),
    lato16w600: TextStyle(fontFamily: 'Lato', fontSize: 16.sp, fontWeight: FontWeight.w600),
    lato20w600: TextStyle(fontFamily: 'Lato', fontSize: 20.sp, fontWeight: FontWeight.w600),
    lato12w700: TextStyle(fontFamily: 'Lato', fontSize: 12.sp, fontWeight: FontWeight.w700),
    lato16w700: TextStyle(fontFamily: 'Lato', fontSize: 16.sp, fontWeight: FontWeight.w700),
    lato32w700: TextStyle(fontFamily: 'Lato', fontSize: 32.sp, fontWeight: FontWeight.w700),
    lato40w700: TextStyle(fontFamily: 'Lato', fontSize: 40.sp, fontWeight: FontWeight.w700),
    // Colors
    white: Colors.white,
    black: Colors.black,
    neutralColor: const Color(0xFFF8F8F8),
  );

  static final dark = AppTheme(
    // Lato Display
    lato8w400: TextStyle(fontFamily: 'Lato', fontSize: 8.sp, fontWeight: FontWeight.w400, color: Colors.white),
    lato12w400: TextStyle(fontFamily: 'Lato', fontSize: 12.sp, fontWeight: FontWeight.w400, color: Colors.white),
    lato14w400: TextStyle(fontFamily: 'Lato', fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.white),
    lato16w400: TextStyle(fontFamily: 'Lato', fontSize: 16.sp, fontWeight: FontWeight.w400, color: Colors.white),
    lato20w400: TextStyle(fontFamily: 'Lato', fontSize: 20.sp, fontWeight: FontWeight.w400, color: Colors.white),
    lato12w500: TextStyle(fontFamily: 'Lato', fontSize: 12.sp, fontWeight: FontWeight.w500, color: Colors.white),
    lato14w600: TextStyle(fontFamily: 'Lato', fontSize: 14.sp, fontWeight: FontWeight.w600, color: Colors.white),
    lato16w600: TextStyle(fontFamily: 'Lato', fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.white),
    lato20w600: TextStyle(fontFamily: 'Lato', fontSize: 20.sp, fontWeight: FontWeight.w600, color: Colors.white),
    lato12w700: TextStyle(fontFamily: 'Lato', fontSize: 12.sp, fontWeight: FontWeight.w700, color: Colors.white),
    lato16w700: TextStyle(fontFamily: 'Lato', fontSize: 16.sp, fontWeight: FontWeight.w700, color: Colors.white),
    lato32w700: TextStyle(fontFamily: 'Lato', fontSize: 32.sp, fontWeight: FontWeight.w700, color: Colors.white),
    lato40w700: TextStyle(fontFamily: 'Lato', fontSize: 40.sp, fontWeight: FontWeight.w700, color: Colors.white),
    // Colors
    white: Colors.white,
    black: Colors.black,
    neutralColor: const Color(0xFF8875FF),
  );

  AppTheme copyWith({
    TextStyle? lato8w400,
    TextStyle? lato12w400,
    TextStyle? lato14w400,
    TextStyle? lato16w400,
    TextStyle? lato20w400,
    TextStyle? lato12w500,
    TextStyle? lato14w600,
    TextStyle? lato16w600,
    TextStyle? lato20w600,
    TextStyle? lato12w700,
    TextStyle? lato16w700,
    TextStyle? lato32w700,
    TextStyle? lato40w700,
    Color? white,
    Color? black,
    Color? neutralColor,
  }) {
    return AppTheme(
      lato8w400: lato8w400 ?? this.lato8w400,
      lato12w400: lato12w400 ?? this.lato12w400,
      lato14w400: lato14w400 ?? this.lato14w400,
      lato16w400: lato16w400 ?? this.lato16w400,
      lato20w400: lato20w400 ?? this.lato20w400,
      lato12w500: lato12w500 ?? this.lato12w500,
      lato14w600: lato14w600 ?? this.lato14w600,
      lato16w600: lato16w600 ?? this.lato16w600,
      lato20w600: lato20w600 ?? this.lato20w600,
      lato12w700: lato12w700 ?? this.lato12w700,
      lato16w700: lato16w700 ?? this.lato16w700,
      lato32w700: lato32w700 ?? this.lato32w700,
      lato40w700: lato40w700 ?? this.lato40w700,
      white: white ?? this.white,
      black: black ?? this.black,
      neutralColor: neutralColor ?? this.neutralColor,
    );
  }
}

// Updated light theme with Lato font and new color
ThemeData lightTheme = ThemeData.light(useMaterial3: true).copyWith(
  scaffoldBackgroundColor: const Color(0xffF2F2F2),
  splashColor: Colors.transparent,
  canvasColor: Colors.transparent,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    titleTextStyle: AppTheme.light.lato16w700,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
    ),
  ),
  extensions: <ThemeExtension<dynamic>>[
    AppTheme.light,
  ],
);

// Updated dark theme with Lato font and new color
ThemeData darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
  scaffoldBackgroundColor: const Color(0xff121212), // Dark background color
  splashColor: Colors.transparent,
  canvasColor: Colors.transparent,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    titleTextStyle: AppTheme.dark.lato16w700, // Dark theme text style
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
    ),
  ),
  extensions: <ThemeExtension<dynamic>>[
    AppTheme.dark,
  ],
);
