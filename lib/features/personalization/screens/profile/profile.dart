import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/common/widgets/images/shop_circular_image.dart';
import 'package:shop/common/widgets/texts/section_heading.dart';
import 'package:shop/features/personalization/controllers/user_controller.dart';
import 'package:shop/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:shop/utils/constants/image_strings.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/common/widgets/shimmers/shimmer.dart';

import 'widgets/change_name.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const ShopAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ShopSizes.defaultSpace),
          child: Column(
            children: [
              //Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty ? networkImage : ShopImages.user;
                      return controller.imageUploading.value
                          ?const ShopShimmerEffect(width: 80, height: 80, radius: 80,) : ShopCircularImage(image: image, width: 80, height: 80, isNetworkImage: networkImage.isNotEmpty);
                    }),
                    TextButton(onPressed: () => controller.uploadUserProfilePicture(), child: const Text('Change Profile Picture')),
                  ],
                ),
              ),

              //Details
              const SizedBox(height: ShopSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: ShopSizes.spaceBtwItems),

              //heading information
              const ShopSectionHeading(title: 'Profile Information', showActionButton: false),
              const SizedBox(height: ShopSizes.spaceBtwItems),

              ShopProfileMenu(title: 'Name', value: controller.user.value.fullName, onPressed: () => Get.to(() => const ChangeName())),
              ShopProfileMenu(title: 'Username', value: controller.user.value.username, onPressed: (){}),

              const SizedBox(height: ShopSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: ShopSizes.spaceBtwItems),

              //heading personal information
              const ShopSectionHeading(title: 'Personal Information', showActionButton: false),
              const SizedBox(height: ShopSizes.spaceBtwItems),

              ShopProfileMenu(title: 'User ID', value: controller.user.value.id,icon: Iconsax.copy, onPressed: (){}),
              ShopProfileMenu(title: 'E-mail', value: controller.user.value.email, onPressed: (){}),
              ShopProfileMenu(title: 'Phone No', value: controller.user.value.phoneNumber, onPressed: (){}),
              ShopProfileMenu(title: 'Gender', value: 'Male', onPressed: (){}),
              ShopProfileMenu(title: 'Date of Birth', value: '08 Feb, 2000', onPressed: (){}),
              const Divider(),
              const SizedBox(height: ShopSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text('Close Account', style: TextStyle(color: Colors.red)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
