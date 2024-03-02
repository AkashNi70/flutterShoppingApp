import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shop/common/widgets/texts/product_price_text.dart';
import 'package:shop/common/widgets/texts/product_title_text.dart';
import 'package:shop/common/widgets/texts/section_heading.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';

class ShopProductsAttributes extends StatelessWidget {
  const ShopProductsAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ShopHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        //selected attribute pricing and description
        ShopRoundedContainer(
          padding: const EdgeInsets.all(ShopSizes.md),
          backgroundColor: dark ? ShopColors.darkerGrey : ShopColors.grey,
          child: Column(
            children: [
              //title, price and status
              Row(
                children: [
                  const ShopSectionHeading(
                      title: 'Variation', showActionButton: false),
                  const SizedBox(width: ShopSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const ShopProductTitleText(
                              title: 'Price : ', smallSize: true),

                          //actual price
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: ShopSizes.spaceBtwItems),

                          //sale price
                          const ShopProductPriceText(price: '20'),
                        ],
                      ),

                      //Stock
                      Row(
                        children: [
                          const ShopProductTitleText(
                              title: 'Stock : ', smallSize: true),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),

              //variation description
              const ShopProductTitleText(
                title:
                    'This is the Description of the Product and it can go up to max 4 times.',
                smallSize: true,
                maxLine: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: ShopSizes.spaceBtwItems),

        //attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ShopSectionHeading(title: 'Colors', showActionButton: false,),
            const SizedBox(height: ShopSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                ShopChoiceChip(text: 'Green', selected: false, onSelected: (value) {}),
                ShopChoiceChip(text: 'Blue', selected: true, onSelected: (value) {}),
                ShopChoiceChip(text: 'Yellow', selected: false, onSelected: (value) {}),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ShopSectionHeading(title: 'Sizes', showActionButton: false),
            const SizedBox(height: ShopSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                ShopChoiceChip(text: 'EU 34', selected: true, onSelected: (value) {}),
                ShopChoiceChip(text: 'EU 36', selected: false, onSelected: (value) {}),
                ShopChoiceChip(text: 'EU 38', selected: false, onSelected: (value) {}),
              ],
            )
          ],
        )
      ],
    );
  }
}
