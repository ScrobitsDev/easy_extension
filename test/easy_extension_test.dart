import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

import '../lib/easy_extension.dart';

String convertToString(DateTime d) {
  return DateFormat("dd-MM-yyyy h:mma").format(d.toLocal().toUtc()).timeAgo;
}

void main() {
  ///
  ///
  /// [TODO] there is time lag when testing for `Just now`
  /// so tests for accurate time delta in seconds might fail
  /// these tests don't consider that as its nominal
  ///
  ///

  test("testing just now",
      () => expect(convertToString(DateTime.now()), "Just now"));

  test(
      "testing seconds just now",
      () => expect(
          convertToString(DateTime.now().subtract(Duration(seconds: 15))),
          "Just now"));

  test(
      "testing minutes",
      () => expect(
          convertToString(DateTime.now().subtract(Duration(minutes: 30))),
          "30m"));

  test(
      "testing hours",
      () => expect(
          convertToString(DateTime.now().subtract(Duration(minutes: 90))),
          "1h"));

  test(
      "testing days",
      () => expect(
          convertToString(DateTime.now().subtract(Duration(days: 3))), "3d"));

  test(
      "testing weeks",
      () => expect(
          convertToString(DateTime.now().subtract(Duration(days: 12))), "1w"));

  test(
      "testing years",
      () => expect(
          convertToString(DateTime.now().subtract(Duration(days: 500))), "1y"));

  test("testing inCaps", () => expect("hello world".inCaps, "Hello world"));

  test("testing capitalizeFirstofEach",
      () => expect("hello world".capitalizeFirstofEach, "Hello World"));

  test("testing isNull", () => expect("hello world".isNull, false));
}
