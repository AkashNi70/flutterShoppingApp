class ShopFormatException implements Exception {

  final String message;

  const ShopFormatException(
      [this.message = 'An unexpected format occurred. Please check your input.']);

  factory ShopFormatException.fromMessage(String message){
    return ShopFormatException(message);
  }

  String get formattedMessage => message;

  factory ShopFormatException.fromCode(String code){
    switch (code) {
      case 'invalid-email-format':
        return const ShopFormatException(
            'The email address format is invalid. Please enter a valid email.');
      case 'invalid-phone-number-format':
        return const ShopFormatException(
            'The provided phone number format is invalid. Please enter a valid number.');
      case 'invalid-date-format':
        return const ShopFormatException(
            'The date format is invalid. Please enter a valid date.');
      case 'invalid-url-format':
        return const ShopFormatException(
            'The URL format is invalid. Please enter a valid URL.');
      case 'invalid-credit-card-format':
        return const ShopFormatException(
            'The credit card format is invalid. Please enter a valid credit card number.');
      case 'invalid-numeric-format':
        return const ShopFormatException(
            'The input should be a valid numeric format.');
        default:
          return const ShopFormatException();
    }
  }
}
