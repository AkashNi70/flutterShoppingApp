import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop/common/styles/shadows.dart';
import 'package:shop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shop/common/widgets/images/shop_rounded_images.dart';
import 'package:shop/common/widgets/texts/product_title_text.dart';
import 'package:shop/features/shop/screens/product_details/product_detail.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/image_strings.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

import '../../icons/shop_circular_icon.dart';
import '../../texts/product_price_text.dart';
import '../../texts/shop_brand_title_text_with_verified_icon.dart';

class ShopProductCardVertical extends StatelessWidget {
  const ShopProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ShopHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetailScreen()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [ShopShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(ShopSizes.productImageRadius),
          color: dark ? ShopColors.darkerGrey : ShopColors.white,
        ),
        child: Column(
          children: [
            ShopRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(ShopSizes.sm),
              backgroundColor: dark ? ShopColors.dark : ShopColors.light,
              child: Stack(
                children: [
                  const ShopRoundedImage(
                    imageUrl: ShopImages.productImage1,
                    applyImageRadius: true,
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

                  //favorite
                  const Positioned(
                      top: 0,
                      right: 0,
                      child: ShopCircularIcon(
                        icon: Iconsax.heart5,
                        color: Colors.red,
                      ))
                ],
              ),
            ),
            const SizedBox(height: ShopSizes.spaceBtwItems / 2),
            //details
            const Padding(
              padding: EdgeInsets.only(left: ShopSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShopProductTitleText(
                      title: 'Green Nike Air Shoes', smallSize: true),
                  SizedBox(height: ShopSizes.spaceBtwItems / 2),
                  ShopBrandTitleWithVerifiedIcon(title: 'Nike'),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Price
                const Padding(
                  padding: EdgeInsets.only(left: ShopSizes.sm),
                  child: ShopProductPriceText(price: '35.0'),
                ), // Text

                Container(
                  decoration: const BoxDecoration(
                    color: ShopColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(ShopSizes.cardRadiusMd),
                      bottomRight:
                          Radius.circular(ShopSizes.productImageRadius),
                    ), // BorderRadius.only
                  ), // BoxDecoration
                  child: const SizedBox(
                    width: ShopSizes.iconLg * 1.2,
                    height: ShopSizes.iconLg * 1.2,
                    child: Center(
                        child: Icon(Iconsax.add, color: ShopColors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
