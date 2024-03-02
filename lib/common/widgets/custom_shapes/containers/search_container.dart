import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class ShopSearchContainer extends StatelessWidget {
  const ShopSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: ShopSizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = ShopHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: ShopDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(ShopSizes.md),
          decoration: BoxDecoration(
            color: showBackground
                ? dark
                    ? ShopColors.dark
                    : ShopColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(ShopSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: ShopColors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(icon, color: ShopColors.darkerGrey),
              const SizedBox(width: ShopSizes.spaceBtwItems),
              Text(text, style: Theme.of(context).textTheme.bodySmall)
            ],
          ),
        ),
      ),
    );
  }
}
