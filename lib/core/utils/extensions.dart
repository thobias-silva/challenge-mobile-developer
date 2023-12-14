import 'package:intl/intl.dart';

extension StringExtension on String {
  bool get isValidEmail {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);
  }
}

extension DateTimeExtension on DateTime {
  String format() {
    return DateFormat('dd/MM/yyyy').format(this);
  }
}
