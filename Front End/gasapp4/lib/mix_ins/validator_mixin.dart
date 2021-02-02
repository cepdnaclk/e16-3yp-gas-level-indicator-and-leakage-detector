class ValidatorMixin {
  //email validation
  String emailValidation(String value) {
    if (value.length > 50) return 'Maximum length limit exceeded';
    if (value.contains('@')) return null;
    return 'Invalid email';
  }

  //password validation
  String passwordValidation(String value) {
    if (value.length < 3) return 'Password must be at least 3 characters';
    return null;
  }

  //phone number validation
  String phonNumberValidation(String value) {
    if (value.length == 10 && !value.contains(RegExp(r'[^0-9]'))) {
      return null;
    }
    return 'Invalid mobile number';
  }

  //Device ID validation
  String deviceIDValidation(String value) {
    if (value.length > 30) return 'Invalid Device ID';
    if (value.length == 0) return 'Device ID not entered';
    return null;
  }

  //Device Name validation
  String deviceNameValidation(String value) {
    if (value.length > 30) return 'Maximum length limit exceeded';
    if (value.length == 0) return 'Device Name not entered';
    return null;
  }
}
