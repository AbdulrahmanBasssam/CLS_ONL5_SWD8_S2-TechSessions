class NumericOperation {
  static int sum(int a, int b) {
    return a + b;
  }

  static int difference(int a, int b) {
    return a - b;
  }

  static int multiply(int a, int b) {
    return a * b;
  }

  static double divide(int a, int b) {
    if (b == 0) {
      throw ArgumentError('Division by zero is not allowed');
    }
    return a / b;
  }

  static int modulo(int a, int b) {
    return a % b;
  }

  static int power(int a, int b) {
    return a ^ b;
  }

  static int average(int a, int b) {
    return (a + b) ~/ 2;
  }
}

// level, deed, civic
class StringUtils {
  static String capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  static bool isPalindrome(String text) {
    final cleaned = text.replaceAll(' ', '').toLowerCase();
    return cleaned == cleaned.split('').reversed.join('');
  }

  static int countWords(String text) {
    if (text.trim().isEmpty) return 0;
    return text.trim().split(RegExp(r'\s+')).length;
  }

  static String reverse(String text) {
    return text.split('').reversed.join('');
  }
}
