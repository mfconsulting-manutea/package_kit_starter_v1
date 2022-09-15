List specialCharacters = [
  '~',
  '`',
  '!',
  '@',
  '#',
  '%',
  '^',
  '&',
  '*',
  '(',
  ')',
  '-',
  '_',
  '+',
  '=',
  '{',
  '}',
  '[',
  ']',
  '|',
  '/',
  ':',
  ';',
  '"',
  '',
  '<',
  '>',
  ',',
  '.',
  '?',
];

class PasswordValidator {
  static Map<String, dynamic>? validator({String? value}) {
    bool? lengthIsLong = value!.length >= 6;
    bool? containSpecialCharacters;
    for (var i = 0; i < specialCharacters.length; i++) {
      var res = value.contains(specialCharacters[i]);

      if (res == true) {
        containSpecialCharacters = res;
        break;
      }
    }

    String? message;
    // ignore: unnecessary_null_comparison
    if (value == null || value.isEmpty) {
      message = "Veuillez entrer un mot de passe";
    } else if (lengthIsLong == false) {
      message = "Le mot de passe renseigné n'est pas suffisament long";
    } else if (containSpecialCharacters == false) {
      message = "Le mot de passe renseigné ne contient pas de caractère spécial";
    } else {
      message = null;
    }

    Map<String, dynamic> results = {
      "parseValue": value,
      "lengthIsLong": lengthIsLong,
      "containSpecialCharacters": containSpecialCharacters,
      "message": message,
    };

    return results;
  }
}
