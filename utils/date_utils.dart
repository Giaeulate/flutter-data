import 'package:intl/intl.dart';

String dateToDateStringUtils(DateTime date) {
  final DateFormat formatter = DateFormat('dd/MM/yyyy');
  return formatter.format(date);
}

String dateToTimeStringUtils(DateTime date) {
  final DateFormat formatter = DateFormat('HH:mm');
  return formatter.format(date);
}

bool isOlderThanSomeYearsUtils(DateTime selectedDate, int years) {
  DateTime currentDate = DateTime.now();
  DateTime minAllowedDate =
      DateTime(currentDate.year - years, currentDate.month, currentDate.day);
  return selectedDate.isBefore(minAllowedDate);
}
