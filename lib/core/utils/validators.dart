abstract class Validators {
  static String? simpleRequired(String value) {
    if (value.trim() == "") {
      return "Este campo es obligatorio";
    } else {
      return null;
    }
  }

  static String? simpleEmail(String value) {
    final RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (emailRegExp.hasMatch(value)) {
      return null;
    } else {
      return "Correo electrónico inválido";
    }
  }

  static String? simplePassword(String value) {
    final RegExp passwordRegExp = RegExp(r'^[\w\d\S]{8,}$');

    if (passwordRegExp.hasMatch(value)) {
      return null;
    } else {
      return "La contraseña debe tener al menos 8 caracteres";
    }
  }

  static String? equalsPassword(String value, String repeatValue) {
    if (value == repeatValue) {
      return null;
    } else {
      return "Las contraseñas no coinciden";
    }
  }

  static String? formatHour(String time) {
    final RegExp horaRegExp = RegExp(r'^(\d{1,2}):(\d{2}) (am|pm)$');

    if (horaRegExp.hasMatch(time)) {
      return null;
    } else {
      return "Formato incorrecto'.";
    }
  }

  static String? requiredDocumentNumber(String value) {
    if (value.length != 8) {
      return "El documento debe tener 8 dígitos";
    } else {
      return null;
    }
  }

  static String? modularCodeRequired(String value) {
    if (value.length < 7) {
      return "El código modular debe tener al menos 7 dígitos";
    } else {
      return null;
    }
  }
}
