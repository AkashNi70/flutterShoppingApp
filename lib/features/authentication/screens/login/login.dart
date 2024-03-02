import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/common/styles/spacing_styles.dart';
import 'package:shop/features/authentication/screens/login/widgets/login_form.dart';
import 'package:shop/features/authentication/screens/login/widgets/login_header.dart';
import 'package:shop/utils/constants/sizes.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: ShopSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              // logo, title and subtitle
              const ShopLoginHeader(),

              //Form
              const ShopLoginForm(),

              //divider
              ShopFormDivider(dividerText: ShopTexts.orSignInWith.capitalize!),

              const SizedBox(height: ShopSizes.spaceBtwSections),

              //footer
              const ShopSocialButtons()

            ],
          ),
        ),
      ),
    );
  }
}



