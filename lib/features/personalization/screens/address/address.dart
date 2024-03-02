import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/features/personalization/screens/address/add_new_address.dart';
import 'package:shop/features/personalization/screens/address/widgets/single_address.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/sizes.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: ShopColors.primary,
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(Iconsax.add, color: ShopColors.white),
      ),
      appBar: ShopAppBar(
        showBackArrow: true,
        title: Text('Addresses', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ShopSizes.defaultSpace),
          child: Column(
            children: [
              ShopSingleAddress(selectedAddress: false),
              ShopSingleAddress(selectedAddress: true),
            ],
          ),
        ),
      ),
    );
  }
}
