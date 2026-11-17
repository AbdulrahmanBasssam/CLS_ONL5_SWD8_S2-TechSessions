import 'package:flutter_test/flutter_test.dart';

import 'logic.dart';

void main() {
  group("Numeric Operation Tests", () {
    test("Sum Test Cases", () {
      expect(NumericOperation.sum(2, 3), 5);
      expect(NumericOperation.sum(-1, 1), 0);
      expect(NumericOperation.sum(0, 0), 0);
      expect(NumericOperation.sum(-7, -2), -9);
    });

    test("Difference Test Cases", () {
      expect(NumericOperation.difference(5, 3), 2);
      expect(NumericOperation.difference(-1, 1), -2);
      expect(NumericOperation.difference(0, 0), 0);
      expect(NumericOperation.difference(-7, -2), -5);
    });

    test("Multiplication Test Cases", () {
      expect(NumericOperation.multiply(2, 3), 6);
      expect(NumericOperation.multiply(-1, 1), -1);
      expect(NumericOperation.multiply(0, 5), 0);
      expect(NumericOperation.multiply(-7, -2), 14);
    });

    test("Division Test Cases", () {
      expect(NumericOperation.divide(6, 3), 2);
      expect(NumericOperation.divide(-6, 3), -2);
      expect(NumericOperation.divide(0, 5), 0);
      expect(() => NumericOperation.divide(6, 0), throwsArgumentError);
    });
  });

  group("String Operation Tests", () {
    test("capitalizeFirstLetter", () {
      expect(StringUtils.capitalizeFirstLetter("baby"), "Baby");
      expect(StringUtils.capitalizeFirstLetter("run"), "Run");
      expect(StringUtils.capitalizeFirstLetter("hello"), "Hello");
    });
    test("isPalindrome", () {
      expect(StringUtils.isPalindrome("level"), true);
      expect(StringUtils.isPalindrome("civic"), true);
      expect(StringUtils.isPalindrome("reer"), true);
      expect(StringUtils.isPalindrome("ali"), false);
    });
    test("countWords", () {
      expect(StringUtils.countWords("baby"), 1);
      expect(StringUtils.countWords("run okay"), 2);
      expect(StringUtils.countWords("hello my friends"), 3);
      expect(StringUtils.countWords("    "), 0);
    });
    test("reverse", () {
      expect(StringUtils.reverse("loli"), "ilol");
      expect(StringUtils.reverse("run"), "nur");
      expect(StringUtils.reverse("hello"), "olleh");
    });
  });
}
