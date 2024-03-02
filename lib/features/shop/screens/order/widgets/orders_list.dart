import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

class ShopOrderListItems extends StatelessWidget {
  const ShopOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ShopHelperFunctions.isDarkMode(context);

    return ListView.separated(
      shrinkWrap: true,
      itemCount: 5,
      separatorBuilder: (_, __) => const SizedBox(height: ShopSizes.spaceBtwItems),
      itemBuilder: (_, index) =>  ShopRoundedContainer(
        showBorder: true,
        padding: const EdgeInsets.all(ShopSizes.md),
        backgroundColor: dark ? ShopColors.dark : ShopColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //row
            Row(
              children: [
                const Icon(Iconsax.ship),
                const SizedBox(width: ShopSizes.spaceBtwItems / 2),

                //status and date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Processing', style: Theme.of(context).textTheme.bodyLarge!.apply(color: ShopColors.primary, fontWeightDelta: 1)),
                      Text('01 Jan 2024', style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),

                //icon
                IconButton(onPressed: () {}, icon: const Icon(Iconsax.arrow_right_34, size: ShopSizes.iconSm))
              ],
            ),
            const SizedBox(height: ShopSizes.spaceBtwItems),
            //row 2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Iconsax.tag),
                      const SizedBox(width: ShopSizes.spaceBtwItems / 2),

                      //status and date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order', style: Theme.of(context).textTheme.labelMedium),
                            Text('[#256f2]', style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Iconsax.calendar),
                      const SizedBox(width: ShopSizes.spaceBtwItems / 2),

                      //status and date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Shipping Date', style: Theme.of(context).textTheme.labelMedium),
                            Text('03 Jan 2024', style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
