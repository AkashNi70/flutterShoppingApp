import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';

class ShopSortableProducts extends StatelessWidget {
  const ShopSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //dropdown
        DropdownButtonFormField(
          decoration:
          const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Newest',
            'Popularity'
          ]
              .map((option) => DropdownMenuItem(
            value: option,
            child: Text(option),
          ))
              .toList(),
        ),
        const SizedBox(height: ShopSizes.spaceBtwSections),
        //products
        ShopGridLayout(itemCount: 10, itemBuilder: (_, index) => const ShopProductCardVertical())
      ],
    );
  }
}