class Validator {
  Validator._();

  static String validateEmail(String value) {
    value = value.trim();
    if (value.isEmpty) throw 'Email is required';

    if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9\-\_]+(\.[a-zA-Z]+)*$").hasMatch(value)) {
      return value;
    }

    throw 'Enter a valid email address';
  }

  static String validateOtp(String otp) {
    if (otp.length >= 4 && RegExp(r'^[0-9]*$').hasMatch(otp)) return otp;
    throw 'Enter a valid OTP';
  }

  static String validatePhone(String phone) {
    phone = switch (phone.substring(0, 1)) {
      '1' => '+880$phone',
      '0' => '+88$phone',
      '8' => '+$phone',
      _ => phone,
    }
        .replaceAll(RegExp('[ -]'), '');

    if (phone.length == 14 && RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$').hasMatch(phone)) return phone;

    throw 'Enter a valid phone number';
  }
}
