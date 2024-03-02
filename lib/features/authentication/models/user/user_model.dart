import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop/utils/formatters/formatter.dart';

class UserModel {

  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  //helper function to get the full name.
  String get fullName => '$firstName $lastName';

  //helper function to format phone number.
  String get formattedPhoneNo => ShopFormatter.formatPhoneNumber(phoneNumber);

  //static function to split full name into first and last name
  static List<String> nameParts(fullName) => fullName.split(" ");

  //static function to generate a username from the full name.
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "shop_$camelCaseUsername";
    return usernameWithPrefix;
  }

  //static function to creation on empty user model.
  static UserModel empty() => UserModel(
      id: '',
      firstName: '',
      lastName: '',
      username: '',
      email: '',
      phoneNumber: '',
      profilePicture: '');

  Map<String, dynamic> toJson() => {
        "FirstName": firstName,
        "LastName": lastName,
        "Username": username,
        "Email": email,
        "PhoneNumber": phoneNumber,
        "ProfilePicture": profilePicture,
      };



  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    if(document.data() != null){
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['firstName'] ?? '',
        lastName: data['lastName'] ?? '',
        username: data['username'] ?? '',
        email: data['email'] ?? '',
        phoneNumber: data['phoneNumber'] ?? '',
        profilePicture: data['profilePicture'] ?? '',
      );
    }else{
      return empty();
    }
  }
}
