import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop/features/authentication/controllers/login/login_controller.dart';
import 'package:shop/features/authentication/screens/password_configuration/forgot_password.dart';
import 'package:shop/features/authentication/screens/signup/signup.dart';
import 'package:shop/navigation_menu.dart';
import 'package:shop/utils/validators/validation.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class ShopLoginForm extends StatelessWidget {
  const ShopLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: ShopSizes.spaceBtwSections),
        child: Column(
          children: [
            //Email
            TextFormField(
              controller: controller.email,
              validator: (value) => ShopValidator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: ShopTexts.email,
              ),
            ),
            const SizedBox(height: ShopSizes.spaceBtwInputFields),
            //Password
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => ShopValidator.validatePassword(value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  labelText: ShopTexts.password,
                  suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye)),
                ),
              ),
            ),
            const SizedBox(height: ShopSizes.spaceBtwInputFields / 2),

            //remember me & forget password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(() => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) => controller.rememberMe.value =
                            !controller.rememberMe.value)),
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
                    onPressed: () => controller.emailAndPasswordLogin(),
                    child: const Text(ShopTexts.signIn))),

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
