import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:shop/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/constants/text_strings.dart';
import 'package:shop/utils/validators/validation.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: const ShopAppBar(showBackArrow: true, title: Text('')),
      body: Padding(
        padding: const EdgeInsets.all(ShopSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //heading
             Text(ShopTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium),
             const SizedBox(height: ShopSizes.spaceBtwItems),
            Text(ShopTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium),
             const SizedBox(height: ShopSizes.spaceBtwSections * 2),

            //text field
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: ShopValidator.validateEmail,
                decoration: const InputDecoration(
                  labelText: ShopTexts.email,
                  prefixIcon: Icon(Iconsax.direct_right),
                ),
              ),
            ),
            const SizedBox(height: ShopSizes.spaceBtwSections),

            //submit button
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => controller.sendPasswordResetEmail(), child: const Text(ShopTexts.submit)))
          ],
        ),
      ),
    );
  }
}
