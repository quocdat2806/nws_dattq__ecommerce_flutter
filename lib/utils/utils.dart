class Utils {
  static bool isEmail(String input) {
    const String emailRegex =
        r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$';
    final RegExp regex = RegExp(emailRegex);
    return regex.hasMatch(input);
  }
  static bool isPassword(String input) {
    return input.length > 4;
  }
}
