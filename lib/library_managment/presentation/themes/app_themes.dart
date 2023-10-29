import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get theme1 => ThemeData(
      iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(AppColors.primaryColor),
      )),
      scaffoldBackgroundColor: AppColors.backgroundColor,
      fontFamily: "TT Interphases Pro Sans Serif Font",
      // elevatedButtonTheme: const ElevatedButtonThemeData(
      //     style: ButtonStyle(
      //   foregroundColor: MaterialStatePropertyAll(Colors.white),
      //   backgroundColor: MaterialStatePropertyAll(AppColors.buttonColor),
      //   shape: MaterialStatePropertyAll(RoundedRectangleBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(10)),
      //   )),
      // )),
      inputDecorationTheme: const InputDecorationTheme(
          floatingLabelBehavior: FloatingLabelBehavior.never),
      primarySwatch: Colors.blue,
      textTheme: TextTheme(
        // headline5: const TextStyle(
        //     color: AppColors.black,
        //     fontWeight: FontWeight.w600,
        //     fontSize: 25),
        bodyMedium: TextStyle(
          color: Colors.black.withOpacity(0.7),
          fontWeight: FontWeight.w400,
          // fontSize: 25
        ),
        bodySmall: const TextStyle(
            color: Colors.grey, fontWeight: FontWeight.w300, fontSize: 15),
      ));
}
