import 'package:flutter/material.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/theme/cusom_themes/appbar_theme.dart';
import 'package:shop/utils/theme/cusom_themes/bottom_sheet_theme.dart';
import 'package:shop/utils/theme/cusom_themes/checkbox_theme.dart';
import 'package:shop/utils/theme/cusom_themes/chip_theme.dart';
import 'package:shop/utils/theme/cusom_themes/elevated_button_theme.dart';
import 'package:shop/utils/theme/cusom_themes/outlined_button_theme.dart';
import 'package:shop/utils/theme/cusom_themes/text_field_theme.dart';
import 'package:shop/utils/theme/cusom_themes/text_theme.dart';

class ShopAppTheme{
   ShopAppTheme._();

   static ThemeData shopLightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      textTheme:ShopTextTheme.shopLightTextTheme,
      chipTheme: ShopChipTheme.shopLightChipTheme,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: ShopAppBarTheme.shopLightAppBarTheme,
      checkboxTheme: ShopCheckboxTheme.shopLightCheckboxTheme,
      bottomSheetTheme: ShopBottomSheetTheme.shopLightBottomSheetTheme,
      elevatedButtonTheme: ShopElevatedButtonTheme.shopLightElevatedBtnTheme,
      outlinedButtonTheme: ShopOutlinedButtonTheme.shopLightOutlinedBtnTheme,
      inputDecorationTheme: ShopTextFormFieldTheme.shopLightInputDecorationTheme
   );
   static ThemeData shopDarkTheme = ThemeData(
       useMaterial3: true,
       fontFamily: 'Poppins',
       brightness: Brightness.dark,
       primaryColor: Colors.blue,
       textTheme:ShopTextTheme.shopDarkTextTheme,
       chipTheme: ShopChipTheme.shopDarkChipTheme,
       scaffoldBackgroundColor: ShopColors.black,
       appBarTheme: ShopAppBarTheme.shopDarkAppBarTheme,
       checkboxTheme: ShopCheckboxTheme.shopDarkCheckboxTheme,
       bottomSheetTheme: ShopBottomSheetTheme.shopDarkBottomSheetTheme,
       elevatedButtonTheme: ShopElevatedButtonTheme.shopDarkElevatedBtnTheme,
       outlinedButtonTheme: ShopOutlinedButtonTheme.shopDarkOutlinedBtnTheme,
       inputDecorationTheme: ShopTextFormFieldTheme.shopDarkInputDecorationTheme
   );
}