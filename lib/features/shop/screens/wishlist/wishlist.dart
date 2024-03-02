import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/common/widgets/icons/shop_circular_icon.dart';
import 'package:shop/common/widgets/layouts/grid_layout.dart';
import 'package:shop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:shop/features/shop/screens/home/home.dart';
import 'package:shop/utils/constants/sizes.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ShopAppBar(
        title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          ShopCircularIcon(icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen()))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ShopSizes.defaultSpace),
          child: Column(
            children: [
              ShopGridLayout(itemCount: 8, itemBuilder: (_, index) => const ShopProductCardVertical() )
            ],
          ),
        ),
      ),
    );
  }
}
