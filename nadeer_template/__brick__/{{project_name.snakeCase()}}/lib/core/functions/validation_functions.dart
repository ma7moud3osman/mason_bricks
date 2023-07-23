import 'package:easy_localization/easy_localization.dart';

bool isEmailValid(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

String? phoneValidation(String? value) {
  if (value == null || value.isEmpty) {
    return "can_not_be_empty".tr();
  } else if (int.tryParse(value.trim()) == null) {
    return 'invalid_value'.tr();
  }
  // if (!value.startsWith("+") || value.length < 8) {
  else if (value.length < 8) {
    return "invalid_phone_warning".tr();
  }
  return null;
}

String? numberValidation(String? value) {
  if (value == null || value.isEmpty) {
    return "can_not_be_empty".tr();
  } else if (int.tryParse(value.trim()) == null) {
    return 'invalid_value'.tr();
  }
  return null;
}

String? otpValidation(String? value) {
  if (value == null || value.length < 6) {
    return "please_enter_valid_code".tr();
  }
  return null;
}

String? emailValidation(String? value) {
  if (value == null || value.isEmpty) {
    return "can_not_be_empty".tr();
  }
  if (!value.contains("@") || !value.contains(".") || value.length < 8) {
    return "invalid_value".tr();
  }
  return null;
}

String? passwordValidation(String? value) {
  if (value!.trim().length < 8) {
    return "minimum_length_is_8_characters".tr();
  }
  final RegExp rex = RegExp("(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\\W)");
  if (!rex.hasMatch(value.trim())) {
    return "*${"password_format".tr()}\n\n •${"password_format_characters".tr()}\n •${"password_format_numbers".tr()}\n •${"password_format_special_chars".tr()}";
  }
  return null;
}

String? titleValidation(String? value) {
  if (value == null || value.isEmpty) {
    return 'can_not_be_empty'.tr();
  } else if (value.trim().length <= 2) {
    return 'must_be_greater'.tr();
  }
  return null;
}

String? codeValidation(String? value) {
  if (value == null || value.isEmpty) {
    return 'can_not_be_empty'.tr();
  } else if (value.trim().length < 4) {
    return 'must_be_greater_than_three_digits'.tr();
  } else if (value.trim().length > 10) {
    return 'must_be_less_than_eleven_digits'.tr();
  }
  return null;
}

String? arabicValidation(String? value) {
  final RegExp rex = RegExp(r'^[\u0600-\u06FF\u0660-\u0669\\s0-9 ]+$');
  if (!rex.hasMatch(value!)) {
    return "only_arabic_letters".tr();
  }
  return null;
}

String? englishValidation(String? value) {
  final RegExp rex = RegExp(r'^[a-zA-Z0-9 ]+$');
  if (!rex.hasMatch(value!)) {
    return "only_english_letters".tr();
  }
  return null;
}

String? reportIdValidation(String? value) {
  if (value == null || value.isEmpty) {
    return 'can_not_be_empty'.tr();
  }
  return null;
}

String? equipmentValidation(String? value) {
  if (value == null || value.isEmpty) {
    return 'can_not_be_empty'.tr();
  }
  return null;
}

String? equipmentCodeValidation(String? value) {
  if (value == null || value.isEmpty) {
    return 'can_not_be_empty'.tr();
  }
  return null;
}

String? actionValidation(String? value) {
  if (value == null || value.isEmpty) {
    return 'can_not_be_empty'.tr();
  }
  return null;
}

String? noValidation(String? value) {
  return null;
}

String? maintainedByValidation(String? value) {
  if (value == null || value.isEmpty) {
    return 'can_not_be_empty'.tr();
  }
  return null;
}

String? invoiceNumberValidation(String? value) {
  if (value == null || value.isEmpty) {
    return 'can_not_be_empty'.tr();
  }
  return null;
}

String? costValidation(String? value) {
  if (value == null || value.isEmpty) {
    return 'can_not_be_empty'.tr();
  } else if (double.tryParse(value.trim()) == null) {
    return 'invalid_value'.tr();
  } else if (double.parse(value.trim()) < 0) {
    return 'value_be_greater_than_zero'.tr();
  }
  return null;
}

String? descriptionValidation(String? value) {
  if (value == null || value.isEmpty) {
    return 'can_not_be_empty'.tr();
  } else if (value.trim().length < 5) {
    return 'must_be_greater_than_four_digits'.tr();
  }
  return null;
}

String? priceValidation(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'minimum_length_is_1_digit'.tr();
  } else if (double.tryParse(value.trim()) == null) {
    return 'invalid_value'.tr();
  } else if (double.parse(value.trim()) == 0) {
    return 'value_be_greater_than_zero'.tr();
  } else if (value.trim().split('.')[0].length > 7) {
    return 'max_length_is_7_digits'.tr();
  }
  return null;
}

String? rangeValidation(String? min, String? max) {
  if (min == null || min.trim().isEmpty) {
    return "please_enter_the_min_price".tr();
  }
  if (max == null || max.trim().isEmpty) {
    return "please_enter_the_max_price".tr();
  }

  final double? doubleMin = double.tryParse(min);
  final double? doubleMax = double.tryParse(max);

  if (doubleMin == null || doubleMin < 0) {
    return "please_enter_valid_price".tr();
  }
  if (doubleMax == null || doubleMax < 0) {
    return "please_enter_valid_price".tr();
  }
  if (doubleMin > doubleMax) {
    return "min < max".tr();
  }
  return null;
}

String? salaryRangeValidation(String? value, String? min, String? max) {
  if (min == null || min.trim().isEmpty) {
    return "please_enter_the_min_price".tr();
  }
  if (max == null || max.trim().isEmpty) {
    return "please_enter_the_max_price".tr();
  }
  if (value == null || value.trim().isEmpty) {
    return "please_enter_valid_value".tr();
  }

  final double? doubleMin = double.tryParse(min);
  final double? doubleMax = double.tryParse(max);
  final double? doubleValue = double.tryParse(value);

  if (doubleMin == null || doubleMin < 0) {
    return "please_enter_valid_price".tr();
  }
  if (doubleMax == null || doubleMax < 0) {
    return "please_enter_valid_price".tr();
  }
  if (doubleValue == null || doubleValue < 0) {
    return "please_enter_valid_value".tr();
  }
  if (doubleValue > doubleMax || doubleValue < doubleMin) {
    return "salary must be between $doubleMax and $doubleMin".tr();
  }
  return null;
}
