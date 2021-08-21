import 'package:intl/intl.dart';

extension StringExtentions on String {
  ///Converts DateTime String to time ago since.
  ///
  ///Can be applied on dd-MM-yyyy h:mma date format for e.g (09-10-2020 08:29AM)
  String get timeAgo {
    if (this == null || this == "") return "";
    DateTime date = DateFormat("dd-MM-yyyy h:mma").parse(this, true);
    final dateNow = DateTime.now();
    DateTime finalTime = date.toLocal();
    final difference = dateNow.difference(finalTime);

    if (difference.inDays > 22) {
      return ((difference.inDays / 7).floor()).toString() + 'w';
    } else if ((difference.inDays / 7).floor() >= 1) {
      return '1w';
    } else if ((difference.inDays / 7).floor() >= 2) {
      return '2w';
    } else if ((difference.inDays / 7).floor() >= 3) {
      return '3w';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays}d';
    } else if (difference.inDays >= 1) {
      return '1d';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours}h';
    } else if (difference.inHours >= 1) {
      return '1h';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes}m';
    } else if (difference.inMinutes >= 1) {
      return '1m';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds}s';
    } else {
      return 'Just now';
    }
  }

  /// Capitalize first letter of first word
  ///
  /// final helloWorld = 'hello world'.inCaps; 
  /// 
  /// 'Hello world'
  String get inCaps {
    if (this == null || this == "") return "";
    return this.length > 0
        ? '${this[0].toUpperCase()}${this.substring(1)}'
        : '';
  }

  /// Capitalize first letter of each word.
  ///
  /// final helloWorld = 'hello world'.capitalizeFirstofEach; 
  /// 
  /// 'Hello World'
  String get capitalizeFirstofEach {
    if (this == null || this == "") return "";
    return this
        .replaceAll(RegExp(' +'), ' ')
        .split(" ")
        .map((str) => str.inCaps)
        .join(" ");
  }
}

extension ObjectExtenstions on Object{
  Object get isNull => this == null;

  
}
