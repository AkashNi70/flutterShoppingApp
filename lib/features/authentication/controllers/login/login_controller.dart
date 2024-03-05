import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop/data/repositories/authentication/authentication_repository.dart';
import 'package:shop/features/personalization/controllers/user_controller.dart';
import 'package:shop/utils/network/network_manager.dart';
import 'package:shop/utils/popups/full_screen_loader.dart';
import 'package:shop/utils/popups/loaders.dart';

import '../../../../utils/constants/image_strings.dart';

class LoginController extends GetxController{
  static LoginController get instance => Get.find();

  //variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());


  @override
  void onInit() {
    // email.text = localStorage.read('REMEMBER_ME_EMAIL');
    // password.text = localStorage.read('REMEMBER_ME_PASSWORD');
    super.onInit();
  }

  //email and password login
  Future<void> emailAndPasswordLogin() async {
    try{
      //start loading
      ShopFullScreenLoader.openLoadingDialog('Logging you in...', ShopImages.docerAnimation);

      //check internet connectivity
      final isConnected = await NetworkManger.instance.isConnected();
      if(!isConnected){
        ShopFullScreenLoader.stopLoading();
        return;
      }

      //Form Validation
      if(!loginFormKey.currentState!.validate()){
        ShopFullScreenLoader.stopLoading();
        return;
      }

      //save data if remember me is selected
      if(rememberMe.value){
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      //login user using email and password authentication
      final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      

      //remove loader
      ShopFullScreenLoader.stopLoading();

      //redirect
      AuthenticationRepository.instance.screenRedirect();
    }catch (e){
      ShopFullScreenLoader.stopLoading();
      ShopLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
    }
  }

  //google signIn authentication
  Future<void> googleSignIn() async {
    try{
      //start loading
      ShopFullScreenLoader.openLoadingDialog('Logging you in...', ShopImages.docerAnimation);

      //check internet connectivity
      final isConnected = await NetworkManger.instance.isConnected();
      if(!isConnected){
        ShopFullScreenLoader.stopLoading();
        return;
      }

      //google authentication
      final userCredentials = await AuthenticationRepository.instance.loginWithGoogle();

      //save user record
      await userController.saveUserRecord(userCredentials);

      //remove loader
      ShopFullScreenLoader.stopLoading();

      //redirect
      AuthenticationRepository.instance.screenRedirect();

    }catch (e){
      ShopLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

}