import 'package:flutter/foundation.dart';
import 'package:flutter_app/model/counter_model.dart'; // Changed to package import

class CounterViewModel extends ChangeNotifier {
  CounterModel _counter = CounterModel();

  int get count => _counter.count;

  void incrementCounter() {
    _counter.count++;
    notifyListeners();
  }
}
