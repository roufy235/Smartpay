import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartpay/config/configs.dart';

class AppTheme {
  AppTheme._();
  static ColorScheme lightColorScheme = ColorScheme.fromSeed(seedColor: AppColors.kPrimary);
  static ColorScheme darkColorScheme = ColorScheme.fromSeed(seedColor: AppColors.kPrimary, brightness: Brightness.dark);

  static ThemeData lightTheme({required BuildContext context}) {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.kScaffoldBg,
      dialogBackgroundColor: AppColors.kScaffoldBg,
      useMaterial3: true,
      colorScheme: AppTheme.lightColorScheme,
      dialogTheme: const DialogTheme(
          backgroundColor: AppColors.kWhite,
          surfaceTintColor: AppColors.kWhite
      ),
      bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: AppColors.kWhite,
          surfaceTintColor: AppColors.kWhite
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.kPrimary,
          foregroundColor: AppColors.kPrimary
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimens.kDefaultBtnRadius),
            ),
            backgroundColor: AppColors.kPrimary,
            foregroundColor: lightColorScheme.onPrimary,
          )
      ),
      textButtonTheme: TextButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimens.kDefaultBtnRadius),
            ),
            foregroundColor: AppColors.kPrimary,
          )
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimens.kDefaultBtnRadius),
            ),
            //backgroundColor: brandColor,
            side: BorderSide(width: 1.0, color: lightColorScheme.primary, style: BorderStyle.solid,),
          )
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.kPrimary,
        //foregroundColor: colorWhite,
        elevation: 0,
      ),
      tabBarTheme: const TabBarTheme(
        labelColor: AppColors.kText,
        unselectedLabelColor: Colors.grey,
        indicatorSize: TabBarIndicatorSize.label,
      ),
      textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
    );
  }

}
