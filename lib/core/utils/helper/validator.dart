class Validator {
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    String pattern = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';
    final emailRegex = RegExp(pattern);
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? validatePassword(String password) {
    if (password.trim().isEmpty) return 'Password is required';

    if (password.length < 8) {
      return 'Password must be at least 8 characters';
    }
    // Check for uppercase, lowercase, digit, and special character
    bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
    bool hasLowercase = password.contains(RegExp(r'[a-z]'));
    bool hasDigit = password.contains(RegExp(r'[0-9]'));
    bool hasSpecialChar = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    if (!hasUppercase || !hasLowercase || !hasDigit || !hasSpecialChar) {
      return "Password must be Strong ";
    }

    return null;
  }

  static String? validateUsername(String? password) {
    bool? hasSpecialChar = password?.contains(
      RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
    );
    bool? hasDigit = password?.contains(RegExp(r'[0-9]'));

    if (hasSpecialChar!) {
      return 'Name does not accept Special Char';
    }

    if (hasDigit!) {
      return 'Name does not accept numeric values';
    }

    if (password == null || password.trim().isEmpty) {
      return 'Name is required';
    }
    if (password.length < 3) {
      return 'Name must be at least 3 characters';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }
    if (value.length < 9) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  static String? validateNotEmpty(
    String? value, {
    String fieldName = 'This field',
  }) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }
}
