import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';

class ShopSpacingStyle{
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: ShopSizes.appBarHeight,
    left: ShopSizes.defaultSpace,
    bottom: ShopSizes.defaultSpace,
    right: ShopSizes.defaultSpace,
  );
}