import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/bindings/general_bindings.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ShopAppTheme.shopLightTheme,
      darkTheme: ShopAppTheme.shopDarkTheme,
      initialBinding: GeneralBindings(),
      ///show loader or circular progress indicator meanwhile Authentication repository is deciding to show relevant screen.
      home: const Scaffold(backgroundColor: ShopColors.primary, body: Center(child: CircularProgressIndicator(color: ShopColors.white))),
    );
  }
}
