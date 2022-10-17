class ValidationController {
  ValidationController._();
  static String? emailValidation(String? email) {
    if (email != null && email.isNotEmpty && email.contains('@')) {
      return null;
    } else {
      return 'Email formatını kontrol edin';
    }
  }

  static String? pbikValidation(String? pbik) {
    if (pbik != null && pbik.isNotEmpty) {
      return null;
    } else {
      return 'Pbik numaranızı kontrol ediniz';
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

  static String? fullAddressValidation(String? fullAddress) {
    if (fullAddress != null && fullAddress.isNotEmpty && fullAddress.length > 15) {
      return null;
    } else {
      return 'adres en az 15 karakterden oluşmalıdır';
    }
  }

  static String? postaCodeValidation(String? postaCode) {
    if (postaCode != null && postaCode.isNotEmpty && postaCode.length == 5) {
      return null;
    } else {
      return 'Posta Kodu 5 karakterden oluşmalıdır';
    }
  }

  static String? telephoneValidation(String? telephoneNumber) {
    if (telephoneNumber != null && telephoneNumber.isNotEmpty && telephoneNumber.length == 11) {
      return null;
    } else {
      return 'Telefon 11 haneden oluşmalıdır';
    }
  }
}
