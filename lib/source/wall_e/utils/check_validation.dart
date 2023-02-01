class CheckValidation {
  static validateEmail(String? emailStr) {
    if (emailStr == null || emailStr.isEmpty) {
      return 'Please enter a email';
    } else if (emailStr.contains('@') && emailStr.contains('.')) {
      return null;
    }
    return 'Please enter a valid email';
  }

  static validateFirstName(String? firstName) {
    if (firstName == null || firstName.isEmpty) {
      return 'Please enter your first name';
    }
    return null;
  }

  static validateLastName(String? lastName) {
    if (lastName == null || lastName.isEmpty) {
      return 'Please enter your last name';
    }
    return null;
  }

  static validatePassword(String? passwordStr) {
    if (passwordStr == null || passwordStr.isEmpty) {
      return 'Please enter a password';
    } else if (passwordStr.length <= 6) {
      return 'Password must be greater than 6 character.';
    }
    return null;
  }

  static validateConfirmPassword(String? confirmPassword, String? passwordStr) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Please enter a password';
    } else if (confirmPassword.length <= 6) {
      return 'Password must be greater than 6 character.';
    } else if (confirmPassword != passwordStr) {
      return 'Password is not same.';
    }
    return null;
  }
}
