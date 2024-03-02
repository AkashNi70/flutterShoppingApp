import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:shop/features/shop/screens/checkout/checkout.dart';
import 'package:shop/utils/constants/sizes.dart';

import '../../../../common/widgets/products/cart/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ShopAppBar(
          showBackArrow: true,
          title:
              Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: const Padding(
        padding: EdgeInsets.all(ShopSizes.defaultSpace),
        child: ShopCartItems(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(ShopSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => const CheckoutScreen()), child: const Text('Checkout \$256.0')),
      ),
    );
  }
}
