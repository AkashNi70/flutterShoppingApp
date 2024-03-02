import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/shop_circular_icon.dart';

class ShopProductQualityAddRemoveButton extends StatelessWidget {
  const ShopProductQualityAddRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ShopCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: ShopSizes.md,
          color: ShopHelperFunctions.isDarkMode(context) ? ShopColors.white : ShopColors.black,
          backgroundColor: ShopHelperFunctions.isDarkMode(context) ? ShopColors.darkerGrey : ShopColors.light,
        ),
        const SizedBox(width: ShopSizes.spaceBtwItems),
        Text('2', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: ShopSizes.spaceBtwItems),
        const ShopCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: ShopSizes.md,
          color: ShopColors.white,
          backgroundColor: ShopColors.primary,
        ),
      ],
    );
  }
}
