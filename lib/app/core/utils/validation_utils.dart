class ValidationUtils {
  static bool validateEmail(String email) {
    const emailRegex = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    return email.length >= 3 && email.isNotEmpty && email.length <= 24 && RegExp(emailRegex).hasMatch(email);
  }

  static bool validatePassword(String password) {
    if (password.isEmpty || password.length < 8 || password.length > 24) {
      return false;
    }
    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return false;
    }
    if (!RegExp(r'[a-z]').hasMatch(password)) {
      return false;
    }
    if (!RegExp(r'[0-9]').hasMatch(password)) {
      return false;
    }
    if (!RegExp(r'[!@#\$%\^&\*(),.?":{}|<>]').hasMatch(password)) {
      return false;
    }
    return true;
  }

  static bool validateName(String name) {
    return name.length >= 3 && name.isNotEmpty && name.length <= 20 && RegExp(r'^[a-zA-Z]+$').hasMatch(name);
  }
}