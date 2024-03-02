import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop/features/authentication/screens/password_configuration/forgot_password.dart';
import 'package:shop/features/authentication/screens/signup/signup.dart';
import 'package:shop/navigation_menu.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class ShopLoginForm extends StatelessWidget {
  const ShopLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: ShopSizes.spaceBtwSections),
        child: Column(
          children: [
            //Email
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: ShopTexts.email,
              ),
            ),
            const SizedBox(height: ShopSizes.spaceBtwInputFields),
            //Password
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.password_check),
                  labelText: ShopTexts.password,
                  suffixIcon: Icon(Iconsax.eye_slash)),
            ),
            const SizedBox(height: ShopSizes.spaceBtwInputFields / 2),

            //remember me & forget password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(ShopTexts.rememberMe),
                  ],
                ),

                //forgot password
                TextButton(
                    onPressed: () => Get.to(() => const ForgotPassword()),
                    child: const Text(ShopTexts.forgetPassword)),
              ],
            ),
            const SizedBox(height: ShopSizes.spaceBtwSections),

            //sign in button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(() => const NavigationMenu()), child: const Text(ShopTexts.signIn))),

            const SizedBox(height: ShopSizes.spaceBtwItems),

            //sign up button
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => Get.to(() => const SignupScreen()),
                    child: const Text(ShopTexts.createAccount))),
          ],
        ),
      ),
    );
  }
}
