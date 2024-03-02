import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/utils/constants/sizes.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ShopAppBar(showBackArrow: true, title: Text('Add new Address')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ShopSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: 'Name'),
                ),
                const SizedBox(height: ShopSizes.spaceBtwInputFields),
                TextFormField(
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.mobile), labelText: 'Phone Number'),
                ),
                const SizedBox(height: ShopSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(child: TextFormField(
                      decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_31), labelText: 'Street'),
                    )),
                    const SizedBox(width: ShopSizes.spaceBtwInputFields),
                    Expanded(child: TextFormField(
                      decoration: const InputDecoration(prefixIcon: Icon(Iconsax.code), labelText: 'Postal Code'),
                    )),
                  ],
                ),
                const SizedBox(height: ShopSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(child: TextFormField(
                      decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building), labelText: 'City'),
                    )),
                    const SizedBox(width: ShopSizes.spaceBtwInputFields),
                    Expanded(child: TextFormField(
                      decoration: const InputDecoration(prefixIcon: Icon(Iconsax.activity), labelText: 'State'),
                    )),
                  ],
                ),
                const SizedBox(height: ShopSizes.spaceBtwInputFields),
                TextFormField(
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.global), labelText: 'Country'),
                ),
                const SizedBox(height: ShopSizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){},
                    child: const Text('Save'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
