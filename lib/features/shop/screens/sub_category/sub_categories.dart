import 'package:flutter/material.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/common/widgets/images/shop_rounded_images.dart';
import 'package:shop/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:shop/common/widgets/texts/section_heading.dart';
import 'package:shop/utils/constants/image_strings.dart';
import 'package:shop/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ShopAppBar(showBackArrow: true, title: Text('Sports')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ShopSizes.defaultSpace),
          child: Column(
            children: [
              //Banner
              const ShopRoundedImage(
                  width: double.infinity,
                  imageUrl: ShopImages.promoBanner2,
                  applyImageRadius: true),
              const SizedBox(height: ShopSizes.spaceBtwSections),

              //sub-categories
              Column(
                children: [
                  //heading
                  ShopSectionHeading(title: 'Sports shoes', onPressed: () {}),
                  const SizedBox(height: ShopSizes.spaceBtwItems / 2),

                  //
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (_, __) => const SizedBox(width: ShopSizes.spaceBtwItems),
                        itemBuilder: (context, index) => const ShopProductCardHorizontal()
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
