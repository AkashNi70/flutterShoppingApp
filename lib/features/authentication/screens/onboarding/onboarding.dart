import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:shop/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:shop/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:shop/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:shop/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:shop/utils/constants/image_strings.dart';
import 'package:shop/utils/constants/text_strings.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          //horizontal scrollable pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                  image: ShopImages.onBoardingImage1,
                  title: ShopTexts.onBoardingTitle1,
                  subTitle: ShopTexts.onBoardingSubTitle1),
              OnBoardingPage(
                  image: ShopImages.onBoardingImage2,
                  title: ShopTexts.onBoardingTitle2,
                  subTitle: ShopTexts.onBoardingSubTitle2),
              OnBoardingPage(
                  image: ShopImages.onBoardingImage3,
                  title: ShopTexts.onBoardingTitle3,
                  subTitle: ShopTexts.onBoardingSubTitle3),
            ],
          ),

          //skip button
          const OnBoardingSkip(),

          //dot navigation smoothPageIndicator
          const OnBoardingDotNavigation(),

          //circle button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}


