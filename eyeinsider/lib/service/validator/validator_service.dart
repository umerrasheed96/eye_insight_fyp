class Validators {
  static String? mandatoryFieldValidation(String? value) {
    if ((value?.trim().isNotEmpty) ?? false) {
      return null;
    } else {
      return 'This field is mandatory';
    }
  }

  static String? emailValidation(String? value) {
    final RegExp emailRegex =
        RegExp(r'^[\w.-]+@[a-zA-Z_-]+?(?:\.[a-zA-Z]{2,})+$');

    final trimEmail = value!.trim();
    if (trimEmail.isNotEmpty) {
      if (!emailRegex.hasMatch(value)) {
        return 'Please provide a valid email';
      } else {
        return null;
      }
    } else {
      return 'Please provide a valid email';
    }
  }

  static String? pinValidationCheck(String? value) {
    final trimText = value!.trim();
    if (trimText.isEmpty) {
      return '* Please enter pin code';
    } else if (trimText.length < 4) {
      return '* Please enter 4 digits pin';
    } else {
      return null;
    }
  }

  static String? passwordValidation(String? value, [String? value2]) {
    final trimText = value!.trim();
    if (trimText.isEmpty) {
      return '* This is required';
    } else if (trimText.length < 6) {
      return '* Password should be at least 6 characters';
    } else if (value2 != null && value2 != trimText) {
      return '* Passwords do not matches';
    } else {
      return null;
    }
  }

  // VIN number validator
  static String? vinValidator(String? value) {
    final String? trimText = value?.trim();

    if (trimText != null && trimText.isNotEmpty && trimText.length != 17) {
      return 'VIN must be exactly 17 characters long, but it is ${trimText.length} characters long.';
    }

    // Ensure that the VIN only contains allowed characters (A-Z and 0-9)
    final vinRegExp = RegExp(r'^[A-HJ-NPR-Z0-9]{17}$');
    if (trimText != null &&
        trimText.isNotEmpty &&
        !vinRegExp.hasMatch(trimText)) {
      // Check for invalid characters specifically
      // final invalidCharacters =
      //     trimText.replaceAll(RegExp(r'[A-HJ-NPR-Z0-9]'), '');
      return ' Only A-Z (except I, O, Q) and 0-9 are allowed.';
    }

    return null;
  }
}