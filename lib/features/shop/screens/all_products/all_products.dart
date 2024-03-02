import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/common/widgets/layouts/grid_layout.dart';
import 'package:shop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:shop/utils/constants/sizes.dart';

import '../../../../common/widgets/products/sortable/sortable_products.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ShopAppBar(
          title: Text('Popular Products'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ShopSizes.defaultSpace),
          child: ShopSortableProducts(),
        ),
      ),
    );
  }
}

