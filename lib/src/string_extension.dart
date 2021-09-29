import 'package:intl/intl.dart';

/// String Extentions
extension StringExtentions on String {
  ///
  /// Converts DateTime String to time ago since.
  /// Only applied on `dd-MM-yyyy h:mma` date format for e.g (09-10-2020 08:29AM),
  /// otherwise throws [FormatException] if date not passed as specified
  String get timeAgo {
    if (this == "") return "";

    DateTime inputDate =
        DateFormat("dd-MM-yyyy h:mma").parse(this, true).toLocal();
    final today = DateTime.now().toLocal();
    final difference = today.difference(inputDate);
    final seconds = difference.inSeconds;
    final days = difference.inDays;

    int count = 0;
    String unit = "Just now";

    // minutes
    if (seconds >= 60) {
      count = (seconds / 60).floor();
      unit = "m";
    }

    // hours
    if (seconds >= 3600) {
      count = (seconds / 3600).floor();
      unit = "h";
    }

    // days
    if (days > 0) {
      count = days;
      unit = "d";
    }

    // weeks
    if (days >= 7) {
      count = (days / 7).floor();
      unit = "w";
    }

    // year
    if (days >= 365) {
      count = (days / 365).floor();
      unit = "y";
    }

    if (count == 0) return unit;

    return "$count" + unit;
  }

  ///
  /// Capitalize first letter of first word
  ///
  /// `final helloWorld = 'hello world'.inCaps;`
  ///
  /// output: `'Hello world'`
  ///
  String get inCaps {
    if (this == "") return "";
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }

  ///
  /// Capitalize first letter of each word.
  ///
  /// `final helloWorld = 'hello world'.capitalizeFirstofEach;`
  ///
  /// output: `'Hello World'`
  ///
  String get capitalizeFirstofEach {
    if (this == "") return "";
    return this
        .replaceAll(RegExp(' +'), ' ')
        .split(" ")
        .map((str) => str.inCaps)
        .join(" ");
  }
}
