import 'package:flutter/material.dart';
import 'package:shop/common/widgets/brands/shop_brand_card.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';

class ShopBrandShowcase extends StatelessWidget {
  const ShopBrandShowcase({
    super.key, required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return ShopRoundedContainer(
      showBorder: true,
      borderColor: ShopColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(ShopSizes.md),
      margin: const EdgeInsets.only(bottom: ShopSizes.spaceBtwItems),
      child: Column(
        children: [
          //brands with products count
          const ShopBrandCard(showBorder: false),
          Row(
            children: images.map((image) => brandTopProductImageWidget(image, context)).toList(),
          ),
        ],
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context){
  return Expanded(
    child: ShopRoundedContainer(
      height: 100,
      backgroundColor: ShopHelperFunctions.isDarkMode(context) ? ShopColors.darkerGrey : ShopColors.light,
      padding: const EdgeInsets.only(right: ShopSizes.sm),
      margin: const EdgeInsets.only(right: ShopSizes.sm),
      child: Image(fit: BoxFit.cover, image: AssetImage(image)),

    ),
  );
}