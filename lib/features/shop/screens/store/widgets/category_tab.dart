import 'package:flutter/material.dart';
import 'package:shop/common/widgets/layouts/grid_layout.dart';
import 'package:shop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:shop/common/widgets/texts/section_heading.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class ShopCategoryTab extends StatelessWidget {
  const ShopCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(ShopSizes.defaultSpace),
          child: Column(
            children: [
              //brands
              const ShopBrandShowcase(images: [ShopImages.productImage1,ShopImages.productImage1,ShopImages.productImage1,]),
              const SizedBox(height: ShopSizes.spaceBtwItems),

              //products
              ShopSectionHeading(title: 'You might like', onPressed: (){}),
              const SizedBox(height: ShopSizes.spaceBtwItems),

              ShopGridLayout(itemCount: 4, itemBuilder: (_, index) => const ShopProductCardVertical())
            ],
          ),
        ),
      ],
    );
  }
}
