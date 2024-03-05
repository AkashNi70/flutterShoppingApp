import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/data/repositories/authentication/authentication_repository.dart';
import 'package:shop/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/constants/text_strings.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/image_strings.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EmailVerifyController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => AuthenticationRepository.instance.logout(),
            icon: const Icon(CupertinoIcons.clear),
          ),
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
              Text(ShopTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: ShopSizes.spaceBtwItems),
              Text(email ?? '',
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),
              const SizedBox(height: ShopSizes.spaceBtwItems),
              Text(ShopTexts.confirmEmailSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: ShopSizes.spaceBtwSections),

              //buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.checkEmailVerificationStatus(),
                    child: const Text(ShopTexts.shopContinue)),
              ),
              const SizedBox(height: ShopSizes.spaceBtwItems),

              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () => controller.sendEmailVerification(), child: const Text(ShopTexts.resendEmail)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
