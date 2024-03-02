import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class ShopVerticalImageText extends StatelessWidget {
  const ShopVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = ShopColors.white,
    this.backgroundColor,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = ShopHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: ShopSizes.spaceBtwItems),
        child: Column(
          children: [
            ///circular icon
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(ShopSizes.md),
              decoration: BoxDecoration(
                  color: backgroundColor ??
                      (dark ? ShopColors.dark : ShopColors.white),
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  color: dark ? ShopColors.light : ShopColors.dark,
                ),
              ),
            ),

            //text
            const SizedBox(height: ShopSizes.spaceBtwItems / 2),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
