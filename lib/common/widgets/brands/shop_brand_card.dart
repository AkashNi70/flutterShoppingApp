import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../images/shop_circular_image.dart';
import '../texts/shop_brand_title_text_with_verified_icon.dart';

class ShopBrandCard extends StatelessWidget {
  const ShopBrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = ShopHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: ShopRoundedContainer(
        padding: const EdgeInsets.all(ShopSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            //icon
            Flexible(
              child: ShopCircularImage(
                isNetworkImage: false,
                image: ShopImages.clothIcon,
                backgroundColor: Colors.transparent,
                overlayColor: isDark ? ShopColors.white : ShopColors.black,
              ),
            ),
            const SizedBox(height: ShopSizes.spaceBtwItems / 2),

            //text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ShopBrandTitleWithVerifiedIcon(
                    title: 'Nike',
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    '256 products',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
