import 'package:flutter/foundation.dart';
import 'package:flutter_app/model/counter_model.dart';

class CounterViewModel extends ChangeNotifier {
  final CounterModel _counter = CounterModel();

  int get count => _counter.count;

  void incrementCounter() {
    _counter.count++;
    notifyListeners();
  }
}
