import 'package:flutter_test/flutter_test.dart';

import 'package:easy_extension/easy_extension.dart';

void main() {
  test('adds one to input values', () {
    expect("09-10-2020 08:29AM".timeAgo, "45w");
    expect("hello world".inCaps, "Hello world");
    expect("hello world".capitalizeFirstofEach, "Hello World");
    expect("hello world".isNull, false);
    // expect(calculator.addOne(0), 1);F
  });
}
