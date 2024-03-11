import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/common/widgets/images/shop_circular_image.dart';
import 'package:shop/common/widgets/texts/section_heading.dart';
import 'package:shop/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:shop/utils/constants/image_strings.dart';
import 'package:shop/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    const ShopCircularImage(image: ShopImages.user, width: 80, height: 80),
                    TextButton(onPressed: (){}, child: const Text('Change Profile Picture')),
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

              ShopProfileMenu(title: 'Name', value: 'Akash Nishad', onPressed: (){}),
              ShopProfileMenu(title: 'Username', value: 'akash001', onPressed: (){}),

              const SizedBox(height: ShopSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: ShopSizes.spaceBtwItems),

              //heading personal information
              const ShopSectionHeading(title: 'Personal Information', showActionButton: false),
              const SizedBox(height: ShopSizes.spaceBtwItems),

              ShopProfileMenu(title: 'User ID', value: '123456',icon: Iconsax.copy, onPressed: (){}),
              ShopProfileMenu(title: 'E-mail', value: 'akash@gmail.com', onPressed: (){}),
              ShopProfileMenu(title: 'Phone No', value: '6306392645', onPressed: (){}),
              ShopProfileMenu(title: 'Gender', value: 'Male', onPressed: (){}),
              ShopProfileMenu(title: 'Date of Birth', value: '08 Feb, 2000', onPressed: (){}),
              const Divider(),
              const SizedBox(height: ShopSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: (){},
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
