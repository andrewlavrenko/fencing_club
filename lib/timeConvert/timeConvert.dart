import 'package:intl/intl.dart';

String formateDateAndTime(timeStamp) {
  var dateFromTimeStamp =
  DateTime.fromMillisecondsSinceEpoch(timeStamp.seconds * 1000);
  return DateFormat('dd-MM-yyyy kk:mm').format(dateFromTimeStamp);
}

String formateDate(timeStamp) {
  var dateFromTimeStamp =
      DateTime.fromMillisecondsSinceEpoch(timeStamp.seconds * 1000);
  return DateFormat('dd-MM-yyyy').format(dateFromTimeStamp);
}

String formateTime(timeStamp) {
  var dateFromTimeStamp =
      DateTime.fromMillisecondsSinceEpoch(timeStamp.seconds * 1000);
  return DateFormat('kk:mm').format(dateFromTimeStamp);
}

String formateDateMY(timeStamp) {
  var dateFromTimeStamp =
      DateTime.fromMillisecondsSinceEpoch(timeStamp.seconds * 1000);
  return DateFormat('MM/yyyy').format(dateFromTimeStamp);
}

String formateDate1(timeStamp) {
  return DateFormat('dd-MM-yyyy').format(timeStamp);
}
