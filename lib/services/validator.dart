class ValidatorService {
  // email validator
  static bool emailValidate(String value) {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final regex = RegExp(pattern);

    return value.isNotEmpty && !regex.hasMatch(value);
  }

  // password validator
  static bool passwordValidate(String value) {
    return value.isNotEmpty && value.length < 8;
  }

  // confirm password validator
  static bool confirmPasswordValidate(String value, String password) {
    return value.isNotEmpty && value != password;
  }

  // birthdate DD-MM-YYYY validator
  static bool birthdateValidate(String value) {
    const pattern =
        r'^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$';

    final regex = RegExp(pattern);

    return value.isNotEmpty && !regex.hasMatch(value);
  }

  // validate date DD-MM-YYYY
  static bool dateValidate(String value) {
    const pattern = r'^([0-9]{2})-([0-9]{2})-([0-9]{4})$';
    final regex = RegExp(pattern);

    return value.isNotEmpty && !regex.hasMatch(value);
  }
}
