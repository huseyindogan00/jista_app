class ValidationController {
  ValidationController._();
  static String? emailValidation(String? email) {
    if (email != null && email.isNotEmpty && email.contains('@')) {
      return null;
    } else {
      return 'Email formatını kontrol edin';
    }
  }

  static String? passwordValidation(String? password) {
    if (password != null && password.isNotEmpty && password.length >= 6) {
      return null;
    } else {
      return 'Şifre en az 6 karakter olmalıdır';
    }
  }

  static String? nameValidation(String? name) {
    if (name != null && name.isNotEmpty && name.length > 3) {
      return null;
    } else {
      return 'isim en az 3 karakte olmalıdır';
    }
  }
}
