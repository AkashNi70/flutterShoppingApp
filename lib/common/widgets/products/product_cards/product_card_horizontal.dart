import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop/common/styles/shadows.dart';
import 'package:shop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shop/common/widgets/icons/shop_circular_icon.dart';
import 'package:shop/common/widgets/images/shop_rounded_images.dart';
import 'package:shop/common/widgets/texts/product_price_text.dart';
import 'package:shop/common/widgets/texts/product_title_text.dart';
import 'package:shop/common/widgets/texts/shop_brand_title_text_with_verified_icon.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/image_strings.dart';

class ShopProductCardHorizontal extends StatelessWidget {
  const ShopProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ShopHelperFunctions.isDarkMode(context);

    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ShopSizes.productImageRadius),
          color: dark ? ShopColors.darkerGrey : ShopColors.softGrey),
      child: Row(
        children: [
          //thumbnail
          ShopRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(ShopSizes.sm),
            backgroundColor: dark ? ShopColors.dark : ShopColors.white,
            child: Stack(
              children: [
                //Thumbnail image
                const SizedBox(
                  height: 120,
                  width: 120,
                  child: ShopRoundedImage(
                      imageUrl: ShopImages.productImage1,
                      applyImageRadius: true),
                ),

                //sale tag
                Positioned(
                  top: 12,
                  child: ShopRoundedContainer(
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
                ),

                //favorite icon button
                const Positioned(
                  top: 0,
                  right: 0,
                  child:
                      ShopCircularIcon(icon: Iconsax.heart5, color: Colors.red),
                ),
              ],
            ),
          ),

          //details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: ShopSizes.sm, left: ShopSizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShopProductTitleText(
                          title: 'Nike white shoes for Men',
                          smallSize: true),
                      SizedBox(height: ShopSizes.spaceBtwItems / 2),
                      ShopBrandTitleWithVerifiedIcon(title: 'Nike'),
                    ],
                  ),

                  const Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //pricing
                      const Flexible(child: ShopProductPriceText(price: '256.0')),

                      //add to cart
                      Container(
                        decoration: const BoxDecoration(
                          color: ShopColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft:
                            Radius.circular(ShopSizes.cardRadiusMd),
                            bottomRight: Radius.circular(
                                ShopSizes.productImageRadius),
                          ), // BorderRadius.only
                        ), // BoxDecoration
                        child: const SizedBox(
                          width: ShopSizes.iconLg * 1.2,
                          height: ShopSizes.iconLg * 1.2,
                          child: Center(
                              child: Icon(Iconsax.add,
                                  color: ShopColors.white)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
