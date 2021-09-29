import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

import '../lib/easy_extension.dart';

String convertToString(DateTime d) {
  return DateFormat("dd-MM-yyyy h:mma").format(d.toLocal().toUtc()).timeAgo;
}

void main() {
  test("testing isNull", () {
    expect("hello world".isNull, false);
    expect(null.isNull, true);
  });

  test("testing isNotNull", () {
    expect("hello world".isNotNull, true);
    expect(null.isNotNull, false);
  });
}
