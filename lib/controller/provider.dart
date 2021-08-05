import 'package:flutter/cupertino.dart';

class Counter extends ChangeNotifier {
  
  var _count = 0;

  int get getCounter {
    return _count;
  }

  void incrementCounter() {
    _count++;
    notifyListeners();
  }
}
