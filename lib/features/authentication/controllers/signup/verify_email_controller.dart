import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shop/common/widgets/success_screen/success_screen.dart';
import 'package:shop/data/repositories/authentication/authentication_repository.dart';
import 'package:shop/utils/constants/image_strings.dart';
import 'package:shop/utils/popups/loaders.dart';

import '../../../../utils/constants/text_strings.dart';

class EmailVerifyController extends GetxController {
  static EmailVerifyController get instance => Get.find();

  //send email
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  //send email verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      ShopLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Please check your inbox and verify your email.');
    } catch (e) {
      ShopLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  //timer to automatically redirect on email verification
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => SuccessScreen(
            image: ShopImages.successfullyRegisterAnimation,
            title: ShopTexts.yourAccountCreatedTitle,
            subTitle: ShopTexts.yourAccountCreatedSubTitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ),
        );
      }
    });
  }

  //manually check if email verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => SuccessScreen(
          image: ShopImages.successfullyRegisterAnimation,
          title: ShopTexts.yourAccountCreatedTitle,
          subTitle: ShopTexts.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ),
      );
    }
  }
}
