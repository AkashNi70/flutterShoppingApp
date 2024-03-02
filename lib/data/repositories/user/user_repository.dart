import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../features/authentication/models/user/user_model.dart';
import '../../../utils/exceptions/custom_exception.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //function to save user data to firestore
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
}
