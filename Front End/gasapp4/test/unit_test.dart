import 'package:flutter_test/flutter_test.dart';
import 'package:gasapp4/mix_ins/validator_mixin.dart';

void main() {
  //email validation tests
  group('Email validation Testing', () {
    test('Correct email returns null', () {
      var result = ValidatorMixin().emailValidation('thilini@gmail.com');
      expect(result, null);
    });

    test('Incorrect email returns invalid email error message', () {
      var result = ValidatorMixin().emailValidation('thilini');
      expect(result, 'Invalid email');
    });

    test('Maximum input limit exceeded email returns error message', () {
      var result = ValidatorMixin().emailValidation(
          'thilinithilinithilinithilinithilinithilinithilinithilini@gmail.com');
      expect(result, 'Maximum length limit exceeded');
    });

    test('Empty email returns invalid email error message', () {
      var result = ValidatorMixin().emailValidation('');
      expect(result, 'Invalid email');
    });
  });

  //password validation testing
  group('Password Validation Testing', () {
    test('password less than 3 charcters returns error message', () {
      var result = ValidatorMixin().passwordValidation('ab');
      expect(result, 'Password must be at least 3 characters');
    });

    test('Correct password returns null', () {
      var result = ValidatorMixin().passwordValidation('abc123');
      expect(result, null);
    });

    test('Empty password returns error message', () {
      var result = ValidatorMixin().passwordValidation('');
      expect(result, 'Password must be at least 3 characters');
    });
  });

  //phone number validation testing
  group('Phone number Validation Testing', () {
    test('Phone number contains non-numerical characters returns error message',
        () {
      var result = ValidatorMixin().phonNumberValidation('07d6kj6879');
      expect(result, 'Invalid mobile number');
    });

    test('Correct phone number returns null', () {
      var result = ValidatorMixin().phonNumberValidation('0712345678');
      expect(result, null);
    });

    test('Empty phone number returns error message', () {
      var result = ValidatorMixin().phonNumberValidation('');
      expect(result, 'Invalid mobile number');
    });

    test('Phone number with charcters less than 10 returns error message', () {
      var result = ValidatorMixin().phonNumberValidation('07167');
      expect(result, 'Invalid mobile number');
    });

    test('Phone number with charcters more than 10 returns error message', () {
      var result = ValidatorMixin().phonNumberValidation('0716789123456');
      expect(result, 'Invalid mobile number');
    });
  });

  //Device ID validation testing
  group('Device ID Validation Testing', () {
    test('Device ID with charcters more than 30 returns error message', () {
      var result = ValidatorMixin()
          .deviceIDValidation('d000000000000000000000000000000003');
      expect(result, 'Invalid Device ID');
    });

    test('Empty Device ID returns error message', () {
      var result = ValidatorMixin().deviceIDValidation('');
      expect(result, 'Device ID not entered');
    });

    test('Correct Device ID returns null', () {
      var result = ValidatorMixin().deviceIDValidation('d0001');
      expect(result, null);
    });
  });

  //Device Name validation testing
  group('Device Name Validation Testing', () {
    test('Device Name with charcters more than 30 returns error message', () {
      var result = ValidatorMixin()
          .deviceNameValidation('kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk');
      expect(result, 'Maximum length limit exceeded');
    });

    test('Empty Device Name returns error message', () {
      var result = ValidatorMixin().deviceNameValidation('');
      expect(result, 'Device Name not entered');
    });

    test('Correct Device Name returns null', () {
      var result = ValidatorMixin().deviceNameValidation('kitchen gas');
      expect(result, null);
    });
  });
}
