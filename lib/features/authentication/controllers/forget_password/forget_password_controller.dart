import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop/data/repositories/authentication/authentication_repository.dart';
import 'package:shop/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:shop/utils/constants/image_strings.dart';
import 'package:shop/utils/network/network_manager.dart';
import 'package:shop/utils/popups/full_screen_loader.dart';
import 'package:shop/utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance => Get.find();

  //variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  //send reset password email
  sendPasswordResetEmail() async {
    try{
      //start loader
      ShopFullScreenLoader.openLoadingDialog('Processing your request...', ShopImages.docerAnimation);

      //check internet connectivity
      final isConnected = await NetworkManger.instance.isConnected();
      if(!isConnected){
        ShopFullScreenLoader.stopLoading();
        return;
      }

      //form validate
      if(!forgetPasswordFormKey.currentState!.validate()){
        ShopFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      //remove loader
      ShopFullScreenLoader.stopLoading();

      //show success screen
      ShopLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset you Password'. tr);

      //redirect
      Get.to(() => ResetPassword(email: email.text.trim()));

    }catch (e){
      //remove loader
      ShopFullScreenLoader.stopLoading();
      ShopLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try{
      //start loader
      ShopFullScreenLoader.openLoadingDialog('Processing your request...', ShopImages.docerAnimation);

      //check internet connectivity
      final isConnected = await NetworkManger.instance.isConnected();
      if(!isConnected){
        ShopFullScreenLoader.stopLoading();
        return;
      }

      //send email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      //remove loader
      ShopFullScreenLoader.stopLoading();

      //show success screen
      ShopLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset you Password'. tr);

    }catch (e){
      //remove loader
      ShopFullScreenLoader.stopLoading();
      ShopLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}