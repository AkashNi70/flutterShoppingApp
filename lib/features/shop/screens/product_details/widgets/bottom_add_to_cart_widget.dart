import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop/common/widgets/icons/shop_circular_icon.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

class ShopAddBottomToCart extends StatelessWidget {
  const ShopAddBottomToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ShopHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: ShopSizes.defaultSpace, vertical: ShopSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? ShopColors.darkerGrey : ShopColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(ShopSizes.cardRadiusLg),
          topRight: Radius.circular(ShopSizes.cardRadiusLg),
        )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const ShopCircularIcon(
                icon: Iconsax.minus,
                backgroundColor: ShopColors.darkGrey,
                width: 40,
                height: 40,
                color: ShopColors.white,
              ),
              const SizedBox(width: ShopSizes.spaceBtwItems),
              Text('2', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: ShopSizes.spaceBtwItems),
              const ShopCircularIcon(
                icon: Iconsax.add,
                backgroundColor: ShopColors.black,
                width: 40,
                height: 40,
                color: ShopColors.white,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(ShopSizes.md),
              backgroundColor: ShopColors.black,
              side: const BorderSide(color: ShopColors.black),
            ),
            child: const Text('Add to Cart'),
          )
        ],
      ),
    );
  }
}
