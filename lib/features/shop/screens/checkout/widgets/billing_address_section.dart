import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shop/common/widgets/texts/section_heading.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/image_strings.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

class ShopBillingAddressSection extends StatelessWidget {
  const ShopBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ShopHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShopSectionHeading(title: 'Shipping Address', buttonTitle: 'Change', onPressed: (){}),
        Text('Akash Nishad', style: Theme.of(context).primaryTextTheme.bodyLarge),
        const SizedBox(height: ShopSizes.spaceBtwItems / 2),

        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: ShopSizes.spaceBtwItems),
            Text('+91 6306392645', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: ShopSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(width: ShopSizes.spaceBtwItems),
            Expanded(child: Text('Geeta Vatika, Gorakhpur, Uttar Pradesh,Pin Code 273006, India', style: Theme.of(context).textTheme.bodyMedium, softWrap: true)),
          ],
        ),
        const SizedBox(height: ShopSizes.spaceBtwItems / 2),

      ],
    );
  }
}
