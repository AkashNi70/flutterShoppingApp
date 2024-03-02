import 'package:flutter/material.dart';
import 'package:shop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shop/common/widgets/texts/section_heading.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/image_strings.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

class ShopBillingPaymentSection extends StatelessWidget {
  const ShopBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ShopHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        ShopSectionHeading(title: 'Payment Method', buttonTitle: 'Change', onPressed: (){}),
        const SizedBox(height: ShopSizes.spaceBtwItems / 2),
        Row(
          children: [
            ShopRoundedContainer(
              width: 60,
              height: 55,
              backgroundColor: dark ? ShopColors.light : ShopColors.white,
              padding: const EdgeInsets.all(ShopSizes.md),
              child: const Image(image: AssetImage(ShopImages.paypal), fit: BoxFit.contain),
            ),
            const SizedBox(width: ShopSizes.spaceBtwItems / 2),
            Text('Paypal', style: Theme.of(context).textTheme.bodyLarge),
          ],
        )
      ],
    );
  }
}
