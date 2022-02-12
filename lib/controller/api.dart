import 'package:intl/intl.dart';

Future<String> getName() async {
  await Future.delayed(Duration(seconds: 5));
  return 'Sourav';
}

Future<String> getTime() async {
  await Future.delayed(Duration(seconds: 5));

  return DateFormat('hh:mm:ss').format(DateTime.now());
}

Stream<int> getSessionTime() {
  return Stream.periodic(Duration(seconds: 1), (i) => i++);
}
