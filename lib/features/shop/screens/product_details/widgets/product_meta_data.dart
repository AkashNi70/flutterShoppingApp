import 'package:flutter/material.dart';
import 'package:shop/common/widgets/images/shop_circular_image.dart';
import 'package:shop/common/widgets/texts/product_price_text.dart';
import 'package:shop/common/widgets/texts/product_title_text.dart';
import 'package:shop/common/widgets/texts/shop_brand_title_text_with_verified_icon.dart';
import 'package:shop/utils/constants/enums.dart';
import 'package:shop/utils/constants/image_strings.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class ShopProductMetaData extends StatelessWidget {
  const ShopProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = ShopHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //price and sale price
        Row(
          children: [
            //sale tag
            ShopRoundedContainer(
              radius: ShopSizes.sm,
              backgroundColor: ShopColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: ShopSizes.sm, vertical: ShopSizes.xs),
              child: Text(
                '25%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: ShopColors.black),
              ),
            ),
            const SizedBox(width: ShopSizes.spaceBtwItems),

            //price
            Text('\$250',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: ShopSizes.spaceBtwItems),
            const ShopProductPriceText(
              price: '175',
              isLarge: true,
            ),
          ],
        ),
        const SizedBox(height: ShopSizes.spaceBtwItems / 1.5),

        //title
        const ShopProductTitleText(title: 'White Nike Sports Shoes'),
        const SizedBox(height: ShopSizes.spaceBtwItems / 1.5),

        //stock status
        Row(
          children: [
            const ShopProductTitleText(title: 'Status'),
            const SizedBox(width: ShopSizes.spaceBtwItems),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: ShopSizes.defaultSpace / 1.5),

        //brand
        Row(
          children: [
            ShopCircularImage(
              image: ShopImages.shoeIcon,
              width: 32,
              height: 32,
              overlayColor: darkMode ? ShopColors.white : ShopColors.black,
            ),
            const ShopBrandTitleWithVerifiedIcon(
                title: 'Nike', brandTextSize: TextSizes.medium),
          ],
        ),
      ],
    );
  }
}
