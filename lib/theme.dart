import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppColors {
  static const primary = Color(0xFF18203D);
  static const secondary = Color(0xFF1E9E9D);
  static const accent = Color(0xFFE4DCA7);

  //text
  static const textDark = Color(0xFF000000);
  static const textLigth = Color(0xFFF5F5F5);
  static const textFaded = Color(0xFF9899A5);
  static const textHighlight = secondary;

  //card
  static const cardLight = Color(0xFFF9FAFE);
  static const cardDark = Color(0xFF303334);

  //icon
  static const iconLight = Color(0xFFB1B4C0);
  static const iconDark = Color(0xFFB1B3C1);
}

abstract class _LightColors {
  static const background = Colors.white;
  static const card = AppColors.cardLight;
}

abstract class _DarkColors {
  static const background = Color(0xFF1B1E1F);
  static const card = AppColors.cardDark;
}

class AppTheme {
  static const primaryColor = AppColors.primary;
  static const secondaryColor = AppColors.secondary;
  static const accentColor = AppColors.accent;
  static final visualDensity = VisualDensity.adaptivePlatformDensity;

  final darkBase = ThemeData.dark();
  final lightBase = ThemeData.light();

  /// Ligth theme and its settings.
  ThemeData get light => ThemeData(
        brightness: Brightness.light,
        colorScheme: lightBase.colorScheme.copyWith(
          primary: secondaryColor,
          secondary: secondaryColor,
        ),
        visualDensity: visualDensity,
        primaryColor: AppColors.primary,
        shadowColor: _LightColors.background,
        textTheme: GoogleFonts.montserratTextTheme()
            .apply(bodyColor: AppColors.textDark),
        backgroundColor: _LightColors.background,
        appBarTheme: lightBase.appBarTheme.copyWith(
          iconTheme: lightBase.iconTheme,
          backgroundColor: _LightColors.background,
          elevation: 0,
          titleTextStyle: GoogleFonts.montserrat(
            color: AppColors.textDark,
            fontWeight: FontWeight.w500,
          ),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        dividerTheme: const DividerThemeData(
          color: AppColors.cardLight,
        ),
        tabBarTheme: lightBase.tabBarTheme.copyWith(
          labelColor: AppColors.textDark,
          labelStyle: GoogleFonts.montserrat(
            color: AppColors.textDark,
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelStyle: GoogleFonts.montserrat(
            color: AppColors.textDark,
            fontWeight: FontWeight.w400,
          ),
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(
              width: 2.0,
              color: AppColors.secondary,
            ),
            insets: EdgeInsets.symmetric(
              horizontal: 20,
            ),
          ),
        ),
        scaffoldBackgroundColor: _LightColors.background,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(primary: AppColors.secondary),
        ),
        cardColor: _LightColors.card,
        primaryTextTheme: const TextTheme(
          headline6: TextStyle(color: AppColors.textDark),
        ),
        iconTheme: const IconThemeData(color: AppColors.iconDark),
      );

  /// Dark theme and its settings.
  ThemeData get dark => ThemeData(
        brightness: Brightness.dark,
        colorScheme: darkBase.colorScheme.copyWith(
          primary: secondaryColor,
          secondary: secondaryColor,
        ),
        visualDensity: visualDensity,
        primaryColor: AppColors.primary,
        shadowColor: _DarkColors.background,
        textTheme: GoogleFonts.montserratTextTheme()
            .apply(bodyColor: AppColors.textLigth),
        backgroundColor: _DarkColors.background,
        appBarTheme: darkBase.appBarTheme.copyWith(
          backgroundColor: _DarkColors.background,
          elevation: 0,
          titleTextStyle: GoogleFonts.montserrat(
            color: AppColors.textLigth,
            fontWeight: FontWeight.w500,
          ),
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        dividerTheme: const DividerThemeData(
          color: AppColors.cardDark,
        ),
        tabBarTheme: darkBase.tabBarTheme.copyWith(
          labelColor: AppColors.textLigth,
          labelStyle: GoogleFonts.montserrat(
            color: AppColors.textLigth,
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelStyle: GoogleFonts.montserrat(
            color: AppColors.textLigth,
            fontWeight: FontWeight.w400,
          ),
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(
              width: 2.0,
              color: AppColors.secondary,
            ),
            insets: EdgeInsets.symmetric(
              horizontal: 20,
            ),
          ),
        ),
        scaffoldBackgroundColor: _DarkColors.background,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(primary: AppColors.secondary),
        ),
        cardColor: _DarkColors.card,
        primaryTextTheme: const TextTheme(
          headline6: TextStyle(color: AppColors.textLigth),
        ),
        iconTheme: const IconThemeData(color: AppColors.iconLight),
      );
}
