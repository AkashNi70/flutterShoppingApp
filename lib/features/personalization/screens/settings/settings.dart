import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:shop/common/widgets/list_tile/settings_menu_tile.dart';
import 'package:shop/common/widgets/texts/section_heading.dart';
import 'package:shop/data/repositories/authentication/authentication_repository.dart';
import 'package:shop/features/personalization/screens/address/address.dart';
import 'package:shop/features/personalization/screens/profile/profile.dart';
import 'package:shop/features/shop/screens/order/order.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/sizes.dart';

import '../../../../common/widgets/list_tile/user_profile_tile.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ShopPrimaryHeaderContainer(
              child: Column(
                children: [
                  ShopAppBar(
                    title: Text('Account',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .apply(color: ShopColors.white)),
                  ),
                  ShopUserProfileTile(onPressed: () => Get.to(() => const ProfileScreen()),),
                  const SizedBox(height: ShopSizes.spaceBtwSections),
                ],
              ),
            ),

            //body
            Padding(
              padding: const EdgeInsets.all(ShopSizes.defaultSpace),
              child: Column(
                children: [
                  const ShopSectionHeading(
                      title: 'Account Settings', showActionButton: false),
                  const SizedBox(height: ShopSizes.spaceBtwItems),

                  ShopSettingsMenuTile(
                      icon: Iconsax.safe_home,
                      title: 'My Addresses',
                      subTitle: 'Set shopping delivery address',
                      onTap: () => Get.to(() => const UserAddressScreen())),
                  ShopSettingsMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: 'My Cart',
                      subTitle: 'Add, remove products and move to checkout',
                      onTap: () {}),
                  ShopSettingsMenuTile(
                      icon: Iconsax.bag_tick,
                      title: 'My Orders',
                      subTitle: 'In-progress and Completed Orders',
                      onTap: () => Get.to(() => const OrderScreen())),
                  ShopSettingsMenuTile(
                      icon: Iconsax.bank,
                      title: 'My Account',
                      subTitle: 'Withdraw balance to registered bank account',
                      onTap: () {}),
                  ShopSettingsMenuTile(
                      icon: Iconsax.discount_shape,
                      title: 'My Coupons',
                      subTitle: 'List of all the discounted coupons',
                      onTap: () {}),
                  ShopSettingsMenuTile(
                      icon: Iconsax.notification,
                      title: 'Notification',
                      subTitle: 'Set any kind of notification message',
                      onTap: () {}),
                  ShopSettingsMenuTile(
                      icon: Iconsax.security_card,
                      title: 'Account Privacy',
                      subTitle: 'Manage data usage and connected accounts',
                      onTap: () {}),

                  //app settings
                  const SizedBox(height: ShopSizes.spaceBtwSections),
                  const ShopSectionHeading(
                      title: 'App Settings', showActionButton: false),
                  const SizedBox(height: ShopSizes.spaceBtwItems),
                  const ShopSettingsMenuTile(
                      icon: Iconsax.document_upload,
                      title: 'Load Data',
                      subTitle: 'Upload Data to your Cloud Firebase'),
                  ShopSettingsMenuTile(
                      icon: Iconsax.location,
                      title: 'Geolocation',
                      subTitle: 'Set recommendation based on location',
                      trailing: Switch(value: true, onChanged: (value) {})),
                  ShopSettingsMenuTile(
                      icon: Iconsax.security_user,
                      title: 'Safe mode',
                      subTitle: 'Search result is safe for all ages',
                      trailing: Switch(value: false, onChanged: (value) {})),
                  ShopSettingsMenuTile(
                      icon: Iconsax.image,
                      title: 'HD Image Quality',
                      subTitle: 'Set image quality to be scan',
                      trailing: Switch(value: false, onChanged: (value) {})),

                  //Logout Button
                  const SizedBox(height: ShopSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => AuthenticationRepository.instance.logout(),
                      child: const Text('Logout'),
                    ),
                  ),
                  const SizedBox(height: ShopSizes.spaceBtwSections * 2.5),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
