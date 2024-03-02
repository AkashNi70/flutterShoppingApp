import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop/features/authentication/screens/login/login.dart';
import 'package:shop/features/authentication/screens/onboarding/onboarding.dart';
import 'package:shop/utils/exceptions/custom_exception.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  ///variable
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  @override
  void onReady(){
    FlutterNativeSplash.remove();
    screenRedirect();
  }


  //function to show relevant screen
  screenRedirect() async{
    //local storage
    deviceStorage.writeIfNull('isFirstTime', true);
    deviceStorage.read('isFirstTime') != true ? Get.offAll(() => const LoginScreen()) : Get.offAll(() => const OnBoardingScreen());
  }

  /*-------------------------------Email & Password sign-in------------------------------------*/

  //emailAuthentication - SignIn


  //emailAuthentication - Register
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try{
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch (e) {
      throw ShopFirebaseAuthException(e.code).message;
    }on FirebaseException catch (e){
      throw ShopFirebaseException(e.code).message;
    }on FormatException catch (_){
      throw const ShopFormatException();
    }on PlatformException catch (e){
      throw ShopPlaShopFormException(e.code).message;
    }
    catch (e){
      throw 'Something went wrong. Please try again';
    }
  }


  //emailAuthentication -


}