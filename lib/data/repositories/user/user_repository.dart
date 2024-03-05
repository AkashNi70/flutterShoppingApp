import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shop/data/repositories/authentication/authentication_repository.dart';

import '../../../features/authentication/models/user/user_model.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/formate_exceptions.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //function to save user data to Firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw ShopFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw ShopFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const ShopFormatException();
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //function to fetch user details based on user id
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).get();
      if(documentSnapshot.exists){
        return UserModel.fromSnapshot(documentSnapshot);
      }else{
        return UserModel.empty();
      }
    } on FirebaseAuthException catch (e) {
      throw ShopFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw ShopFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const ShopFormatException();
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //function to update user data in Firestore.
  Future<void> updateUserDetails(UserModel updateUserModel) async {
    try {
      await _db.collection("Users").doc(updateUserModel.id).update(updateUserModel.toJson());
    } on FirebaseAuthException catch (e) {
      throw ShopFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw ShopFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const ShopFormatException();
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //update any field in specific users collection
  Future<void> updateSingleDetails(Map<String, dynamic> json) async {
    try {
      await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).update(json);
    } on FirebaseAuthException catch (e) {
      throw ShopFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw ShopFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const ShopFormatException();
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //remove user data from firestore
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
    } on FirebaseAuthException catch (e) {
      throw ShopFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw ShopFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const ShopFormatException();
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //upload any image
}
