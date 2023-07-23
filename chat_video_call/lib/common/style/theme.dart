import 'package:chat_video_call/common/values/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static double horizontalMargin = 16.0;
  static double radius = 10.0;
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    //useMaterial3: true,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    primaryColor: AppColor.primaryBackground,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColor.primaryBackground,
    ),
    cardColor: AppColor.primaryBackground,
    dialogBackgroundColor: AppColor.primaryBackground,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: AppColor.primaryText,
      ),
      titleTextStyle: TextStyle(
        color: AppColor.primaryText,
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
      ),
      toolbarTextStyle: TextStyle(
        color: AppColor.primaryText,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColor.primarySecondaryBackground,
      unselectedLabelStyle: TextStyle(fontSize: 12),
      selectedLabelStyle: TextStyle(fontSize: 12),
      unselectedItemColor: Color(0xFFA2A5B9),
      selectedItemColor: AppColor.primaryBg,
    ),
    tabBarTheme: const TabBarTheme(
      indicatorSize: TabBarIndicatorSize.label,
      unselectedLabelColor: AppColor.primarySecondaryElementText,
      labelColor: AppColor.primaryBg,
    ),
  );
}
