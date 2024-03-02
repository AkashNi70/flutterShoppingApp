import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:shop/common/widgets/texts/section_heading.dart';
import 'package:shop/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:shop/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:shop/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:shop/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:shop/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:shop/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ShopHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: ShopAddBottomToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //products image slider
            const ShopProductImageSlider(),

            //product details
            Padding(
              padding: const EdgeInsets.only(
                  right: ShopSizes.defaultSpace,
                  left: ShopSizes.defaultSpace,
                  bottom: ShopSizes.defaultSpace),
              child: Column(
                children: [
                  //rating and share button
                  const ShopRatingAndShare(),

                  //price, title, stock & brand
                  const ShopProductMetaData(),

                  //attributes
                  const ShopProductsAttributes(),
                  const SizedBox(height: ShopSizes.spaceBtwSections),

                  //checkout button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Checkout'),
                    ),
                  ),
                  const SizedBox(height: ShopSizes.spaceBtwSections),

                  //description
                  const ShopSectionHeading(
                      title: 'Description', showActionButton: false),
                  const SizedBox(height: ShopSizes.spaceBtwItems),
                  const ReadMoreText(
                    'This is a Product Description for White Nike Shoes. There are more things that can be added but i am just practicing and nothing ele.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  //reviews
                  const Divider(),
                  const SizedBox(height: ShopSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const ShopSectionHeading(
                          title: 'Reviews(199)', showActionButton: false),
                      IconButton(
                          onPressed: () => Get.to(() => const ProductReviewsScreen()),
                          icon: const Icon(Iconsax.arrow_right_3, size: 18)),
                    ],
                  ),
                  const SizedBox(height: ShopSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
