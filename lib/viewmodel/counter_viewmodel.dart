import 'package:flutter/foundation.dart';
import '../model/counter_model.dart';

class CounterViewModel extends ChangeNotifier {
  CounterModel _counter = CounterModel();

  int get count => _counter.count;

  void incrementCounter() {
    _counter.count++;
    notifyListeners();
  }
}
