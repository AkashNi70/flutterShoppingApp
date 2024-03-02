import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/common/widgets/success_screen/success_screen.dart';
import 'package:shop/features/authentication/screens/login/login.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/constants/text_strings.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/image_strings.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.offAll(() => const LoginScreen()), icon: const Icon(CupertinoIcons.clear),),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(ShopSizes.defaultSpace),
            child: Column(
              children: [
                //image
                Image(image: const AssetImage(ShopImages.deliveredEmailIllustration), width: ShopHelperFunctions.screenHeight() * 0.6,),
                const SizedBox(height: ShopSizes.spaceBtwSections),
                
                //title and subtitle
                Text(ShopTexts.confirmEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
                const SizedBox(height: ShopSizes.spaceBtwItems),
                Text('example@gmail.com', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
                const SizedBox(height: ShopSizes.spaceBtwItems),
                Text(ShopTexts.confirmEmailSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
                const SizedBox(height: ShopSizes.spaceBtwSections),

                //buttons
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () => Get.to(() => SuccessScreen(
                          image: ShopImages.staticSuccessIllustration,
                          title: ShopTexts.yourAccountCreatedTitle,
                          subTitle: ShopTexts.yourAccountCreatedSubTitle,
                          onPressed: () => Get.to(() => const LoginScreen()),
                        ),),
                      child: const Text(ShopTexts.shopContinue)),
                ),
                const SizedBox(height: ShopSizes.spaceBtwItems),

                SizedBox(width: double.infinity, child: TextButton(onPressed: (){}, child: const Text(ShopTexts.resendEmail)),)

              ],
            ),
        ),
      ),
    );
  }
}
