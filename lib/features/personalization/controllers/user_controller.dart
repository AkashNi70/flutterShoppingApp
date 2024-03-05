import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop/data/repositories/authentication/authentication_repository.dart';
import 'package:shop/data/repositories/user/user_repository.dart';
import 'package:shop/features/authentication/screens/login/login.dart';
import 'package:shop/features/personalization/screens/profile/widgets/re_authentication_user_login_form.dart';
import 'package:shop/utils/constants/image_strings.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/popups/full_screen_loader.dart';
import 'package:shop/utils/popups/loaders.dart';

import '../../../utils/network/network_manager.dart';
import '../../authentication/models/user/user_model.dart';

class UserController extends GetxController{

  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();


  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  //fetch user record
  Future<void> fetchUserRecord() async {
    try{
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    }catch (e){
      user(UserModel.empty());
    }finally{
      profileLoading.value = false;
    }
  }

  //save user record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredential) async{
    try{
      //refresh user record
      await fetchUserRecord();

      //if no record already stored
      if(user.value.id.isEmpty){
        if(userCredential != null){
          //covert name to first and last name
          final nameParts = UserModel.nameParts(userCredential.user!.displayName ?? '');
          final username = UserModel.generateUsername(userCredential.user!.displayName ?? '');

          //map data
          final user = UserModel(
              id: userCredential.user!.uid,
              firstName: nameParts[0],
              lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
              username: username,
              email: userCredential.user!.email ?? '',
              phoneNumber: userCredential.user!.phoneNumber ?? '',
              profilePicture: userCredential.user!.photoURL ?? ''
          );

          //save user data
          await userRepository.saveUserRecord(user);
        }
      }

    }catch (e){
      ShopLoaders.warningSnackBar(title: 'Data not saved', message: 'Something went wrong saving your information. You can re-save your data in your profile.');
    }
  }

  //delete account warning
  void deleteAccountWarningPopup(){
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(ShopSizes.md),
      title: 'Delete Account',
      middleText: 'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
      confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount(),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red, side: const BorderSide(color: Colors.red)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: ShopSizes.lg),
            child: Text('Delete'),
          ),
      ),
      cancel: OutlinedButton(
          onPressed: () => Navigator.of(Get.overlayContext!).pop(),
          child: const Text('Cancel')
      )
    );
  }


  //delete user account
  void deleteUserAccount() async {
    try{
      ShopFullScreenLoader.openLoadingDialog('Processing', ShopImages.docerAnimation);

      //first re-authentication
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      if(provider.isNotEmpty){
        //re verify auth email
        if(provider == 'google.com'){
          await auth.loginWithGoogle();
          await auth.deleteAccount();
          ShopFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        }else if(provider == 'password'){
          ShopFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }

    }catch (e){
      ShopFullScreenLoader.stopLoading();
      ShopLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  //re-authentication before deleting
  Future<void> reAuthenticationEmailAndPasswordUser() async {
    try{
      //start loader
      ShopFullScreenLoader.openLoadingDialog(
          'Processing', ShopImages.docerAnimation);

      //check internet connection
      final isConnected = await NetworkManger.instance.isConnected();
      if (!isConnected) {
        //remove loader
        ShopFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!reAuthFormKey.currentState!.validate()) {
        //remove loader
        ShopFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.reAuthenticationWithEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      ShopFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    }catch (e){
      ShopFullScreenLoader.stopLoading();
      ShopLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  //upload profile image
  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70, maxWidth: 512, maxHeight: 512);
      if(image !=null){
        imageUploading.value = true;
        //upload image
        final imageUrl = await userRepository.uploadImage('Users/Images/Profile', image);

        //update user image record
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleDetails(json);

        user.value.profilePicture = imageUrl;
        user.refresh();

        ShopLoaders.successSnackBar(title: 'Congratulations', message: 'Your Profile image has been updated!');
      }
    } catch (e) {
      ShopLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }finally{
      imageUploading.value = false;
    }
  }

}