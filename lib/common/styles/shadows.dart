import 'package:flutter/cupertino.dart';
import 'package:shop/utils/constants/colors.dart';

class ShopShadowStyle{

  static final verticalProductShadow = BoxShadow(
      color: ShopColors.darkerGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2)
  );

  static final horizontalProductShadow = BoxShadow(
      color: ShopColors.darkerGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2)
  );


}