import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:shop/features/authentication/screens/login/login.dart';
import 'package:shop/utils/constants/image_strings.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/constants/text_strings.dart';

import '../../../../utils/helpers/helper_functions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ShopSizes.defaultSpace),
          child: Column(
            children: [
              //image
              Image(
                image: const AssetImage(ShopImages.deliveredEmailIllustration),
                width: ShopHelperFunctions.screenHeight() * 0.6,
              ),
              const SizedBox(height: ShopSizes.spaceBtwSections),

              //title and subtitle
              Text(email,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: ShopSizes.spaceBtwItems),
              Text(ShopTexts.changeYourPasswordTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: ShopSizes.spaceBtwItems),
              Text(ShopTexts.changeYourPasswordSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: ShopSizes.spaceBtwSections),

              //buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => Get.offAll(() => const LoginScreen()),
                      child: const Text(ShopTexts.done))),
              const SizedBox(height: ShopSizes.spaceBtwSections),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () => ForgetPasswordController.instance
                          .resendPasswordResetEmail(email),
                      child: const Text(ShopTexts.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}
