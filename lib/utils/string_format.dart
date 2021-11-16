import 'package:intl/intl.dart';

String formatToMoney(int value) {
  final format = NumberFormat('#,##0', 'en_US');
  return format.format(value);
}
