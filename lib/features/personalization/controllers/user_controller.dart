import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shop/data/repositories/user/user_repository.dart';
import 'package:shop/utils/popups/loaders.dart';

import '../../authentication/models/user/user_model.dart';

class UserController extends GetxController{
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());


  @override
  void onInit() {
    fetchUserRecord();
    super.onInit();
  }

  //fetch user record
  Future<void> fetchUserRecord() async {
    try{
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    }catch (e){
      user(UserModel.empty());
    }
  }

  //save user record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredential) async{
    try{
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
    }catch (e){
      ShopLoaders.warningSnackBar(title: 'Data not saved', message: 'Something went wrong saving your information. You can re-save your data in your profile.');
    }
  }



}