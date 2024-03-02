import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/common/widgets/brands/shop_brand_card.dart';
import 'package:shop/common/widgets/layouts/grid_layout.dart';
import 'package:shop/common/widgets/products/sortable/sortable_products.dart';
import 'package:shop/common/widgets/texts/section_heading.dart';
import 'package:shop/features/shop/screens/brand/brand_products.dart';
import 'package:shop/utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ShopAppBar(title: Text('Brand'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ShopSizes.defaultSpace),
          child: Column(
            children: [
              //heading
              const ShopSectionHeading(
                  title: 'Brands', showActionButton: false),
              const SizedBox(height: ShopSizes.spaceBtwItems),

              //brands
              ShopGridLayout(
                itemCount: 10,
                mainAxisExtent: 80,
                itemBuilder: (context, index) => ShopBrandCard(
                  showBorder: true,
                  onTap: () => Get.to(() => const BrandProducts()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
