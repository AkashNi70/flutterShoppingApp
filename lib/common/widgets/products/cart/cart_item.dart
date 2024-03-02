import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/shop_rounded_images.dart';
import '../../texts/product_title_text.dart';
import '../../texts/shop_brand_title_text_with_verified_icon.dart';

class ShopCartItem extends StatelessWidget {
  const ShopCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Image
        ShopRoundedImage(
          imageUrl: ShopImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(ShopSizes.sm),
          backgroundColor: ShopHelperFunctions.isDarkMode(context) ? ShopColors.darkerGrey : ShopColors.light,
        ),
        const SizedBox(width: ShopSizes.spaceBtwItems),

        //title, price, & size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ShopBrandTitleWithVerifiedIcon(title: 'Nike'),
              const Flexible(child: ShopProductTitleText(title: 'White Nike Shoes', maxLine: 1)),

              //Attribute
              Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(text: 'Color: ', style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: 'Green ', style: Theme.of(context).textTheme.bodyLarge),
                        TextSpan(text: 'Size: ', style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: 'UL 08', style: Theme.of(context).textTheme.bodyLarge),
                      ]
                  )
              )
            ],
          ),
        )
      ],
    );
  }
}