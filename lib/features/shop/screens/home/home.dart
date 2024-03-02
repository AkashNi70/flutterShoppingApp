import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:shop/features/shop/screens/all_products/all_products.dart';
import 'package:shop/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:shop/features/shop/screens/home/widgets/home_categories.dart';
import 'package:shop/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/image_strings.dart';
import 'package:shop/utils/constants/sizes.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/texts/section_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
           const ShopPrimaryHeaderContainer(
              child: Column(
                children: [
                  //appbar
                  ShopHomeAppBar(),
                  SizedBox(height: ShopSizes.spaceBtwSections),

                  //search bar
                  ShopSearchContainer(text: 'Search in Store'),
                  SizedBox(height: ShopSizes.spaceBtwSections),

                  //categories
                  Padding(
                    padding: EdgeInsets.only(left: ShopSizes.defaultSpace),
                    child: Column(
                      children: [
                        //heading
                        ShopSectionHeading(
                            title: 'Popular Categories',
                            showActionButton: false,
                            textColor: ShopColors.white),
                        SizedBox(height: ShopSizes.spaceBtwItems),

                        //categories section
                        ShopHomeCategories()
                      ],
                    ),
                  ),

                  SizedBox(height: ShopSizes.spaceBtwSections,)
                ],
              ),
            ),

            //body
            Padding(
              padding: const EdgeInsets.all(ShopSizes.defaultSpace),
              child: Column(
                children: [
                  const ShopPromoSlider(banners: [ShopImages.promoBanner1,ShopImages.promoBanner2,ShopImages.promoBanner3]),
                  const SizedBox(height: ShopSizes.spaceBtwSections),

                  //Heading
                  ShopSectionHeading(title: 'Popular Products', onPressed: () => Get.to(() => const AllProducts()),),
                  const SizedBox(height: ShopSizes.spaceBtwItems),

                  //popular products
                  ShopGridLayout(itemCount: 4, itemBuilder: (_, index) => const ShopProductCardVertical(),),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

