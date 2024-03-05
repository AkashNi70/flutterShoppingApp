import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop/data/repositories/authentication/authentication_repository.dart';
import 'package:shop/data/repositories/user/user_repository.dart';
import 'package:shop/features/authentication/screens/signup/verify_email.dart';
import 'package:shop/utils/constants/image_strings.dart';
import 'package:shop/utils/network/network_manager.dart';
import 'package:shop/utils/popups/full_screen_loader.dart';
import 'package:shop/utils/popups/loaders.dart';

import '../../models/user/user_model.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  //signup
  void signup() async {
    try {
      //start loader
      ShopFullScreenLoader.openLoadingDialog(
          'We are processing you information...', ShopImages.docerAnimation);

      //check internet connection
      final isConnected = await NetworkManger.instance.isConnected();
      if (!isConnected) {
        //remove loader
        ShopFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!signupFormKey.currentState!.validate()) {
        //remove loader
        ShopFullScreenLoader.stopLoading();
        return;
      }

      //privacy policy validate
      if (!privacyPolicy.value) {
        ShopLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.',
        );
        return;
      }

      //register
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //save authentication
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: userName.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');

      final userRepository = Get.put(UserRepository());
      userRepository.saveUserRecord(newUser);

      //remove loader
      ShopFullScreenLoader.stopLoading();


      //show success message
      ShopLoaders.successSnackBar(title: 'Congratulations', message: 'Your account has been created! verify email to continue.');

      //move to verify email screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));

    } catch (e) {
      //remove loader
      ShopFullScreenLoader.stopLoading();
      //show more generic error to the user
      ShopLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());

    }
  }
}
