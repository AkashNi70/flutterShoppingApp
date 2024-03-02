import 'package:flutter/material.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/device/device_utility.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

class ShopTabBar extends StatelessWidget implements PreferredSizeWidget{
  const ShopTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = ShopHelperFunctions.isDarkMode(context);
    return Material(
      color:  dark ? ShopColors.black : ShopColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: ShopColors.primary,
        unselectedLabelColor: ShopColors.darkerGrey,
        labelColor: dark ? ShopColors.white : ShopColors.primary,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(ShopDeviceUtils.getAppBarHeight());
}
