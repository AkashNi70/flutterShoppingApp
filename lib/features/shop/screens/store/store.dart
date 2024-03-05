import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/common/widgets/appbar/tabbar.dart';
import 'package:shop/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:shop/common/widgets/layouts/grid_layout.dart';
import 'package:shop/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:shop/common/widgets/texts/section_heading.dart';
import 'package:shop/features/shop/controllers/category_controller.dart';
import 'package:shop/features/shop/screens/brand/all_brands.dart';
import 'package:shop/features/shop/screens/store/widgets/category_tab.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/brands/shop_brand_card.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: ShopAppBar(
          title:
              Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            ShopCounterIcon(onPressed: () {}),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: ShopHelperFunctions.isDarkMode(context)
                    ? ShopColors.black
                    : ShopColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(ShopSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      //search box
                      const SizedBox(height: ShopSizes.spaceBtwItems),
                      const ShopSearchContainer(
                        text: 'Search in Store',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: ShopSizes.spaceBtwSections),

                      //heading
                      ShopSectionHeading(
                          title: 'Featured Brands', onPressed: () => Get.to(() => const AllBrandsScreen())),
                      const SizedBox(
                        height: ShopSizes.spaceBtwItems / 1.5,
                      ),

                      ShopGridLayout(
                          itemCount: 4,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            return const ShopBrandCard(
                              showBorder: false,
                            );
                          })
                    ],
                  ),
                ),

                //tabs
                bottom: ShopTabBar(
                  tabs: categories.map((category) => Tab(child: Text(category.name))).toList(),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: categories.map((category) => ShopCategoryTab(category: category)).toList(),
          ),
        ),
      ),
    );
  }
}
