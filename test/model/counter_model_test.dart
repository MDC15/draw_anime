import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/model/counter_model.dart'; // Adjust import if your app name is different

void main() {
  group('CounterModel', () {
    test('should initialize with count 0 by default', () {
      final model = CounterModel();
      expect(model.count, 0);
    });

    test('should initialize with given count', () {
      final model = CounterModel(count: 5);
      expect(model.count, 5);
    });

    test('should allow count to be updated', () {
      final model = CounterModel();
      model.count = 10;
      expect(model.count, 10);
    });
  });
}
