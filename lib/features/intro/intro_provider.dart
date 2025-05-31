import 'dart:async';
import 'package:flutter/foundation.dart';
import 'intro_model.dart';

class IntroProvider extends ChangeNotifier {
  IntroModel _model = const IntroModel();
  Timer? _timer;

  IntroModel get model => _model;
  bool get shouldNavigateToHome => _model.shouldNavigateToHome;
  double get animationProgress => _model.animationProgress;

  void startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      _model = _model.copyWith(
        animationProgress: _model.animationProgress + 0.033,
      );

      if (_model.animationProgress >= 1.0) {
        _model = _model.copyWith(shouldNavigateToHome: true);
        _timer?.cancel();
      }

      notifyListeners();
    });
  }

  void skipToHome() {
    _model = _model.copyWith(shouldNavigateToHome: true);
    _timer?.cancel();
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
