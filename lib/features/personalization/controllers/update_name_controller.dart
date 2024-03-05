import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop/data/repositories/user/user_repository.dart';
import 'package:shop/features/personalization/controllers/user_controller.dart';
import 'package:shop/features/personalization/screens/profile/profile.dart';
import 'package:shop/utils/constants/image_strings.dart';
import 'package:shop/utils/network/network_manager.dart';
import 'package:shop/utils/popups/full_screen_loader.dart';
import 'package:shop/utils/popups/loaders.dart';

class UpdateNameController extends GetxController{
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  Future<void> initializeNames() async{
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async{
    try{
      //start Loading
      ShopFullScreenLoader.openLoadingDialog('We are updating your information...', ShopImages.docerAnimation);

      //check internet connectivity
      final isConnected = await NetworkManger.instance.isConnected();
      if(!isConnected){
        ShopFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if(!updateUserNameFormKey.currentState!.validate()){
        ShopFullScreenLoader.stopLoading();
        return;
      }

      //update user first and last name in the firebase firestore
      Map<String, dynamic> name = {'FirstName': firstName.text.trim(), 'LastName': lastName.text.trim()};
      await userRepository.updateSingleDetails(name);

      //update the rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      //remove loader
      ShopFullScreenLoader.stopLoading();

      //Show success screen
      ShopLoaders.successSnackBar(title: 'Congratulations', message: 'Your Name has been updated.');

      //move to previous screen
      Get.off(() => const ProfileScreen());

    }catch (e){
      ShopFullScreenLoader.stopLoading();
      ShopLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

}