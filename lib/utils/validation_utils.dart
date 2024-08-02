class ValidationUtils {
  static bool isValidEmail(String? email) {
    if (email == null) return false;
    var regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return (regex.hasMatch(email));
  }
}
