class ShopFirebaseAuthException implements Exception {
  final String code;

  ShopFirebaseAuthException(this.code);

  String get message {
    // Custom messages based on the Firebase Auth exception code
    switch (code) {
      case 'weak-password':
        return 'The password provided is too weak.';
      case 'invalid-email':
        return 'Email is not valid or badly formatted.';
      case 'email-already-in-use':
        return 'The account already exists for that email.';
      case 'operation-not-allowed':
        return 'Operation is not allowed. Please contact support.';
      case 'user-disabled':
        return 'The user has been disabled. Please contact support for help.';
      default:
        return 'Firebase Authentication Error: $code';
    }
  }
}

class ShopFirebaseException implements Exception {
  final String code;
  ShopFirebaseException(this.code);
  String get message {
    // Custom messages based on the Firebase exception code
    // Add more cases for other Firebase exception codes as needed
    switch (code) {
      default:
        return 'Firebase Error: $code';
    }
  }
}

class ShopFormatException implements Exception {
  const ShopFormatException();
  String get message => 'Invalid format.';
}

class ShopPlaShopFormException implements Exception {
  final String code;

  ShopPlaShopFormException(this.code);
  String get message {
    // Custom messages based on the Platform exception code
    // Add more cases for other Platform exception codes as needed
    switch (code) {
      default:
        return 'Platform Error: $code';
    }
  }
}