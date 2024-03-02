import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/common/widgets/login_signup/form_divider.dart';
import 'package:shop/common/widgets/login_signup/social_buttons.dart';
import 'package:shop/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/constants/text_strings.dart';

import '../../../../common/widgets/appbar/appbar.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const ShopAppBar(showBackArrow: true, title: Text('')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ShopSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(ShopTexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: ShopSizes.spaceBtwSections),

              //Form
              const ShopSignupForm(),

              const SizedBox(height: ShopSizes.spaceBtwSections),
              //divider
              ShopFormDivider(dividerText: ShopTexts.orSignUpWith.capitalize!),

              const SizedBox(height: ShopSizes.spaceBtwSections),
              //social button
              const ShopSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

