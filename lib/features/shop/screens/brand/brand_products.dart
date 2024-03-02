import 'package:flutter/material.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/common/widgets/brands/shop_brand_card.dart';
import 'package:shop/common/widgets/products/sortable/sortable_products.dart';
import 'package:shop/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ShopAppBar(title: Text('Nike')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ShopSizes.defaultSpace),
          child: Column(
            children: [
              //brand details
              ShopBrandCard(showBorder: true),
              SizedBox(height: ShopSizes.spaceBtwSections),

              ShopSortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
