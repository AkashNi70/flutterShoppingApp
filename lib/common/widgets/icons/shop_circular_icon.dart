import 'package:flutter/material.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';

class ShopCircularIcon extends StatelessWidget {
  const ShopCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = ShopSizes.lg,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor != null
            ? backgroundColor!
            : ShopHelperFunctions.isDarkMode(context)
                ? ShopColors.black.withOpacity(0.9)
                : ShopColors.white.withOpacity(0.9),
      ),
      child: IconButton(
          onPressed: onPressed, icon: Icon(icon, color: color, size: size)),
    );
  }
}
