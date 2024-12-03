class Validator {
  static bool isPhoneNumberValid(String phoneNumber) {
    return RegExp(r'^\+?[1-9]\d{1,14}$').hasMatch(phoneNumber) &&
        phoneNumber.length >= 10;
  }

  static bool validateOTP(String userOtp, String realOtp) {
    if (userOtp == realOtp) {
      return true;
    } else {
      return false;
    }
  }
}
