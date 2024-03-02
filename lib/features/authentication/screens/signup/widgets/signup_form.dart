import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop/features/authentication/controllers/signup/signup_controller.dart';
import 'package:shop/features/authentication/screens/signup/verify_email.dart';
import 'package:shop/utils/validators/validation.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ShopSignupForm extends StatelessWidget {
  const ShopSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = ShopHelperFunctions.isDarkMode(context);
    final controller = Get.put(SignupController());

    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      ShopValidator.validateEmptyText('First Name', value),
                  decoration: const InputDecoration(
                    labelText: ShopTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: ShopSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      ShopValidator.validateEmptyText('Last Name', value),
                  decoration: const InputDecoration(
                    labelText: ShopTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: ShopSizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.userName,
            validator: (value) =>
                ShopValidator.validateEmptyText('Username', value),
            decoration: const InputDecoration(
              labelText: ShopTexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(height: ShopSizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.email,
            validator: (value) => ShopValidator.validateEmail(value),
            decoration: const InputDecoration(
              labelText: ShopTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(height: ShopSizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => ShopValidator.validatePhoneNumber(value),
            decoration: const InputDecoration(
              labelText: ShopTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: ShopSizes.spaceBtwInputFields),
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
          const SizedBox(height: ShopSizes.spaceBtwSections),

          //terms & conditions checkbox
          Row(
            children: [
              SizedBox(
                  width: 24,
                  height: 24,
                  child: Obx(() => Checkbox(
                      value: controller.privacyPolicy.value,
                      onChanged: (value) => controller.privacyPolicy.value =
                          !controller.privacyPolicy.value))),
              const SizedBox(width: ShopSizes.spaceBtwItems),
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: '${ShopTexts.iAgreeTo} ',
                          style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(
                          text: '${ShopTexts.privacyPolicy} ',
                          style: Theme.of(context).textTheme.bodySmall!.apply(
                              color:
                                  dark ? ShopColors.white : ShopColors.primary,
                              decoration: TextDecoration.underline,
                              decorationColor: dark
                                  ? ShopColors.white
                                  : ShopColors.primary)),
                      TextSpan(
                          text: '${ShopTexts.and} ',
                          style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(
                          text: '${ShopTexts.termsOfUse} ',
                          style: Theme.of(context).textTheme.bodySmall!.apply(
                              color:
                                  dark ? ShopColors.white : ShopColors.primary,
                              decoration: TextDecoration.underline,
                              decorationColor: dark
                                  ? ShopColors.white
                                  : ShopColors.primary)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: ShopSizes.spaceBtwSections),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text(ShopTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
