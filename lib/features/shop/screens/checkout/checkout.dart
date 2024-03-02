import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shop/common/widgets/success_screen/success_screen.dart';
import 'package:shop/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:shop/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:shop/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:shop/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:shop/navigation_menu.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/image_strings.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/products/cart/coupon_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ShopHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: ShopAppBar(
        showBackArrow: true,
        title: Text('Order Review',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ShopSizes.defaultSpace),
          child: Column(
            children: [
              //items in cart
              const ShopCartItems(showAddRemoveButton: false),
              const SizedBox(height: ShopSizes.spaceBtwSections),

              //coupon text-field
              const ShopCouponCode(),
              const SizedBox(height: ShopSizes.spaceBtwSections),

              //billing section
              ShopRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(ShopSizes.md),
                backgroundColor: dark ? ShopColors.black : ShopColors.white,
                child: const Column(
                  children: [
                    //pricing
                    ShopBillingAmountSection(),
                    SizedBox(height: ShopSizes.spaceBtwItems),

                    //divider
                    Divider(),
                    SizedBox(height: ShopSizes.spaceBtwItems),

                    //payment method
                    ShopBillingPaymentSection(),
                    SizedBox(height: ShopSizes.spaceBtwItems),

                    //address
                    ShopBillingAddressSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(ShopSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => SuccessScreen(
                image: ShopImages.successfullyPaymentIcon,
                title: 'Payment Success!',
                subTitle: 'Your item will be shipped soon!',
                onPressed: () => Get.offAll(() => const NavigationMenu()),
            )),
            child: const Text('Checkout \$256.0')),
      ),
    );
  }
}
