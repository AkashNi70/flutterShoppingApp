import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop/data/repositories/user/user_repository.dart';
import 'package:shop/features/authentication/screens/login/login.dart';
import 'package:shop/features/authentication/screens/onboarding/onboarding.dart';
import 'package:shop/features/authentication/screens/signup/verify_email.dart';
import 'package:shop/navigation_menu.dart';

import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/formate_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  ///variable
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  //get authentication user data
  User? get authUser => _auth.currentUser;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  //function to show relevant screen
  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      //local storage
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnBoardingScreen());
    }
  }

  /*-------------------------------Email & Password sign-in------------------------------------*/

  //emailAuthentication - SignIn
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw ShopFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw ShopFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const ShopFormatException();
    } on PlatformException catch (e) {
      throw ShopPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //emailAuthentication - Register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw ShopFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw ShopFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const ShopFormatException();
    } on PlatformException catch (e) {
      throw ShopPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //emailAuthentication - mail verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw ShopFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw ShopFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const ShopFormatException();
    } on PlatformException catch (e) {
      throw ShopPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //forgot password
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw ShopFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw ShopFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const ShopFormatException();
    } on PlatformException catch (e) {
      throw ShopPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //re-authentication
  Future<void> reAuthenticationWithEmailAndPassword(String email, String password) async {
    try {
      //create a credential
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);

      //re-authentication
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw ShopFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw ShopFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const ShopFormatException();
    } on PlatformException catch (e) {
      throw ShopPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //google login
  Future<UserCredential> loginWithGoogle() async {
    try {
      //trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      //obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

      //create a new credential
      final credential = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      //once signed in, return the userCredential
      return await _auth.signInWithCredential(credential);

    } on FirebaseAuthException catch (e) {
      throw ShopFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw ShopFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const ShopFormatException();
    } on PlatformException catch (e) {
      throw ShopPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //logout - valid for any authentication
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw ShopFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw ShopFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const ShopFormatException();
    } on PlatformException catch (e) {
      throw ShopPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //delete account
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw ShopFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw ShopFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const ShopFormatException();
    } on PlatformException catch (e) {
      throw ShopPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
