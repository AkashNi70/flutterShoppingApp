import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

class ShopSocialButtons extends StatelessWidget {
  const ShopSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: ShopColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: ShopSizes.iconMd,
              height: ShopSizes.iconMd,
              image: AssetImage(ShopImages.google),
            ),
          ),
        ),
        const SizedBox(width: ShopSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: ShopColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: ShopSizes.iconMd,
              height: ShopSizes.iconMd,
              image: AssetImage(ShopImages.facebook),
            ),
          ),
        ),
      ],
    );
  }
}
