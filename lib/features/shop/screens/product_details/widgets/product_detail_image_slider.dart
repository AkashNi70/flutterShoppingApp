import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/icons/shop_circular_icon.dart';
import '../../../../../common/widgets/images/shop_rounded_images.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ShopProductImageSlider extends StatelessWidget {
  const ShopProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = ShopHelperFunctions.isDarkMode(context);

    return ShopCurvedEdgesWidget(
      child: Container(
        color: dark ? ShopColors.darkerGrey : ShopColors.light,
        child: Stack(
          children: [
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(
                    ShopSizes.productImageRadius * 2),
                child:
                Image(image: AssetImage(ShopImages.productImage1)),
              ),
            ),

            //Image slider
            Positioned(
              right: 0,
              bottom: 30,
              left: ShopSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: 6,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(width: ShopSizes.spaceBtwItems),
                  itemBuilder: (_, index) => ShopRoundedImage(
                    width: 80,
                    backgroundColor: dark ? ShopColors.dark : ShopColors.white,
                    border: Border.all(color: ShopColors.primary),
                    padding: const EdgeInsets.all(ShopSizes.sm),
                    imageUrl: ShopImages.productImage1,
                  ),
                ),
              ),
            ),

            //appbar icons
            const ShopAppBar(
              showBackArrow: true,
              actions: [
                ShopCircularIcon(icon: Iconsax.heart5, color: Colors.red,)
              ],
            )
          ],
        ),
      ),
    );
  }
}