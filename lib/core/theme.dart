import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants/colors.dart';
import 'constants/text_styles.dart';

final appTheme = ThemeData(
  visualDensity: VisualDensity.standard,
  useMaterial3: true,
  applyElevationOverlayColor: true,
  colorSchemeSeed: AppColors.primary,
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
  splashFactory:
      Platform.isAndroid ? InkRipple.splashFactory : NoSplash.splashFactory,
  materialTapTargetSize: MaterialTapTargetSize.padded,
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.zero),
    ),
  ),
  dividerTheme: const DividerThemeData(thickness: 1),
);

final ThemeData lightTheme = appTheme.copyWith(
  primaryColor: AppColors.primary,
  iconTheme: const IconThemeData(color: AppColors.primary),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: AppColors.primary,
    secondary: AppColors.secondary,
    onSecondary: AppColors.grey,
    error: AppColors.red,
    onError: AppColors.red,
    background: AppColors.backgroundColor,
    onBackground: Colors.white,
    surface: AppColors.cA82682,
    onSurface: AppColors.cA82682,
  ),
  scaffoldBackgroundColor: AppColors.backgroundColor,
  cardColor: Colors.white,
  canvasColor: Colors.white,
  dialogTheme: const DialogTheme(
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) => AppColors.primary,
      ),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.grey;
          }
          return AppColors.primary;
        },
      ),
      textStyle: const MaterialStatePropertyAll(
        TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      elevation: const MaterialStatePropertyAll(0),
      shape: const MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      fixedSize: const MaterialStatePropertyAll(Size(double.infinity, 48)),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(),
  bottomSheetTheme: const BottomSheetThemeData(
    elevation: 0,
    showDragHandle: true,
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: true,
    selectedLabelStyle: TextStyle(fontSize: 12),
    unselectedLabelStyle: TextStyle(fontSize: 12, color: Color(0xff6C7488)),
    unselectedItemColor: Color(0xff6C7488),
    selectedItemColor: AppColors.primary,
    elevation: 2,
  ),
  tabBarTheme: const TabBarTheme(
    labelColor: Color(0xff111126),
    unselectedLabelColor: Color(0xff111126),
    dividerColor: Colors.transparent,
    overlayColor: MaterialStatePropertyAll(Colors.transparent),
    labelStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    indicator: BoxDecoration(
      color: AppColors.primary,
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  ),
  navigationBarTheme: NavigationBarThemeData(
    elevation: 0,
    backgroundColor: Colors.white,
    height: kToolbarHeight,
    iconTheme: MaterialStateProperty.resolveWith<IconThemeData>(
      (states) => const IconThemeData(
        color: Colors.black,
      ),
    ),
    labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
      (states) => const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 17,
      ),
    ),
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 1,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      // ios
      statusBarBrightness: Brightness.light,
      // android
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
    iconTheme: IconThemeData(color: Colors.black),
    shadowColor: Colors.black45,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 17,
    ),
    toolbarTextStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 17,
    ),
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.white,
  ),
  textTheme: TextTheme(
    /// text headline title style
    displayLarge: MyTextStyle.w700.copyWith(
      color: Colors.white,
      fontSize: 24,
    ),
    displayMedium: MyTextStyle.w700.copyWith(
      color: AppColors.secondary,
      fontSize: 18,
    ),
    displaySmall: MyTextStyle.w700.copyWith(
      color: AppColors.secondary,
      fontSize: 16,
    ),

    titleLarge: MyTextStyle.w400.copyWith(
      color: AppColors.secondary,
      fontSize: 18,
    ),

    /// text field title style
    titleMedium: MyTextStyle.w400.copyWith(
      color: AppColors.secondary,
      fontSize: 16,
    ),
    titleSmall: MyTextStyle.w400.copyWith(
      color: AppColors.secondary,
      fontSize: 14,
    ),

    /// list tile title style
    bodyLarge: MyTextStyle.w600.copyWith(
      color: AppColors.secondary,
      fontSize: 18,
    ),

    /// list tile subtitle style
    bodyMedium: MyTextStyle.w600.copyWith(
      color: AppColors.secondary,
      fontSize: 16,
    ),
    bodySmall: MyTextStyle.w600.copyWith(
      color: AppColors.secondary,
      fontSize: 14,
    ),
  ),
);

// final ThemeData darkTheme = appTheme.copyWith(
//   primaryColor: AppColors.primary,
//   scaffoldBackgroundColor: AppColors.backgroundColor,
//   iconTheme: const IconThemeData(
//     color: AppColors.whiteFF,
//   ),
//   colorScheme: const ColorScheme(
//     brightness: Brightness.dark,
//     primary: AppColors.primary,
//     onPrimary: AppColors.primary,
//     secondary: AppColors.gray46,
//     onSecondary: AppColors.gray46,
//     error: AppColors.red00,
//     onError: AppColors.red30,
//     background: AppColors.backgroundColor,
//     onBackground: AppColors.backgroundColor,
//     surface: AppColors.whiteFF,
//     onSurface: AppColors.whiteFF,
//   ),
//   textSelectionTheme: const TextSelectionThemeData(
//     cursorColor: AppColors.primary,
//   ),
//   dialogBackgroundColor: AppColors.backgroundColor,
//   dialogTheme: const DialogTheme(
//     backgroundColor: AppColors.backgroundColor,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.all(Radius.circular(10)),
//     ),
//   ),
//   bottomSheetTheme: const BottomSheetThemeData(
//     elevation: 0,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.only(
//         topLeft: Radius.circular(24),
//         topRight: Radius.circular(24),
//       ),
//     ),
//   ),
//   tabBarTheme: const TabBarTheme(
//     labelColor: Colors.white,
//     indicator: BoxDecoration(
//       borderRadius: BorderRadius.all(
//         Radius.circular(12),
//       ),
//       color: AppColors.primary,
//     ),
//   ),
//   bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//     showSelectedLabels: true,
//     type: BottomNavigationBarType.fixed,
//     backgroundColor: AppColors.gray46,
//     selectedItemColor: AppColors.primary,
//     unselectedItemColor: AppColors.grayEC,
//     unselectedLabelStyle: TextStyle(
//       fontFamily: AppColors.fonts,
//       fontWeight: FontWeight.w500,
//       fontSize: 12,
//       height: 15 / 12,
//       color: AppColors.grayEC,
//     ),
//     selectedLabelStyle: TextStyle(
//       fontFamily: AppColors.fonts,
//       fontWeight: FontWeight.w500,
//       fontSize: 12,
//       height: 15 / 12,
//       color: AppColors.primary,
//     ),
//   ),
//   appBarTheme: const AppBarTheme(
//     elevation: 0,
//     centerTitle: true,
//     shadowColor: AppColors.gray57,
//     systemOverlayStyle: SystemUiOverlayStyle(
//       statusBarColor: Colors.transparent,
//       systemNavigationBarColor: AppColors.gray2d,
//
//       /// android
//       statusBarIconBrightness: Brightness.light,
//
//       /// ios
//       statusBarBrightness: Brightness.dark,
//     ),
//     iconTheme: IconThemeData(color: Colors.white),
//     titleTextStyle: TextStyle(
//       fontSize: 18,
//       color: Colors.white,
//       fontWeight: FontWeight.w400,
//     ),
//     backgroundColor: AppColors.gray46,
//     surfaceTintColor: AppColors.gray46,
//   ),
//   inputDecorationTheme: const InputDecorationTheme(
//     filled: true,
//     fillColor: Color.fromRGBO(0, 0, 0, 0.5),
//     border: OutlineInputBorder(
//       borderSide: BorderSide(color: AppColors.gray57),
//     ),
//     enabledBorder: OutlineInputBorder(
//       borderSide: BorderSide(color: AppColors.gray57),
//     ),
//     focusedBorder: OutlineInputBorder(
//       borderSide: BorderSide(color: AppColors.gray57),
//     ),
//   ),
//   textTheme: const TextTheme(
//     displayLarge: TextStyle(color: Colors.white),
//     displayMedium: TextStyle(color: Colors.white),
//     displaySmall: TextStyle(color: Colors.white),
//     labelLarge: TextStyle(color: Colors.white),
//     labelMedium: TextStyle(color: Colors.white),
//     labelSmall: TextStyle(color: Colors.white),
//     bodySmall: TextStyle(
//       color: Colors.white,
//       fontWeight: FontWeight.w500,
//       fontSize: 17,
//     ),
//     bodyMedium: TextStyle(
//       color: Colors.white,
//       fontWeight: FontWeight.w500,
//       fontSize: 17,
//     ),
//     bodyLarge: TextStyle(color: Colors.white),
//   ),
// );
