import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/viewmodel/counter_viewmodel.dart'; // Adjust import

void main() {
  group('CounterViewModel', () {
    late CounterViewModel viewModel;

    setUp(() {
      viewModel = CounterViewModel();
    });

    test('initial count is 0', () {
      expect(viewModel.count, 0);
    });

    test('incrementCounter should increment count and notify listeners', () {
      bool listenerCalled = false;
      viewModel.addListener(() {
        listenerCalled = true;
      });

      viewModel.incrementCounter();
      expect(viewModel.count, 1);
      expect(listenerCalled, isTrue);

      viewModel.incrementCounter();
      expect(viewModel.count, 2);
    });
  });
}
