import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';

class ShopSingleAddress extends StatelessWidget {
  const ShopSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = ShopHelperFunctions.isDarkMode(context);

    return ShopRoundedContainer(
      padding: const EdgeInsets.all(ShopSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress ? ShopColors.primary.withOpacity(0.5) : Colors.transparent,
      borderColor: selectedAddress ? Colors.transparent : dark ? ShopColors.darkerGrey : ShopColors.grey,
      margin: const EdgeInsets.only(bottom: ShopSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress ? dark ? ShopColors.light : ShopColors.dark : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Akash Nishad',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: ShopSizes.sm / 2),
              const Text('(+91) 630 639 2645', maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: ShopSizes.sm / 2),
              const Text('Geeta Vatika, Gorakhpur, Uttar Pradesh,Pin Code 273006, India', softWrap: true)
            ],
          )
        ],
      ),
    );
  }
}
