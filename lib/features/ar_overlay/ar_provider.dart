import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'ar_model.dart';

class ArProvider extends ChangeNotifier {
  ArModel _model = const ArModel();

  ArModel get model => _model;
  bool get isLoading => _model.isLoading;
  bool get isCameraInitialized => _model.isCameraInitialized;
  AnimeImageModel? get selectedAnimeImage => _model.selectedAnimeImage;
  List<Offset> get drawingPoints => _model.drawingPoints;

  Future<void> initializeCamera() async {
    _model = _model.copyWith(isLoading: true);
    notifyListeners();

    try {
      // Simulate camera initialization
      await Future.delayed(const Duration(seconds: 1));

      _model = _model.copyWith(
        isCameraInitialized: true,
        isLoading: false,
      );
    } catch (e) {
      _model = _model.copyWith(isLoading: false);
      if (kDebugMode) {
        print('Camera initialization failed: $e');
      }
    }

    notifyListeners();
  }

  void switchCamera() {
    _model = _model.copyWith(isLoading: true);
    notifyListeners();

    // Simulate camera switch
    Future.delayed(const Duration(milliseconds: 500), () {
      _model = _model.copyWith(isLoading: false);
      notifyListeners();
    });
  }

  Future<void> selectAnimeImage() async {
    _model = _model.copyWith(isLoading: true);
    notifyListeners();

    try {
      // Simulate API call to get anime image
      await Future.delayed(const Duration(seconds: 2));

      final animeImage = AnimeImageModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        url: 'https://example.com/anime-image.png',
        title: 'Generated Anime Character',
        style: 'Anime Style',
        metadata: const {'generated_at': 'now'},
      );

      _model = _model.copyWith(
        selectedAnimeImage: animeImage,
        isLoading: false,
      );
    } catch (e) {
      _model = _model.copyWith(isLoading: false);
      if (kDebugMode) {
        print('Failed to load anime image: $e');
      }
    }

    notifyListeners();
  }

  void addDrawingPoint(Offset point) {
    final newPoints = [..._model.drawingPoints, point];
    _model = _model.copyWith(drawingPoints: newPoints);
    notifyListeners();
  }

  void clearDrawing() {
    _model = _model.copyWith(drawingPoints: []);
    notifyListeners();
  }

  Future<void> captureImage() async {
    _model = _model.copyWith(isLoading: true);
    notifyListeners();

    try {
      // Simulate image capture and processing
      await Future.delayed(const Duration(seconds: 1));

      // Here you would typically save the combined image
      if (kDebugMode) {
        print('Image captured and saved');
      }

      _model = _model.copyWith(isLoading: false);
    } catch (e) {
      _model = _model.copyWith(isLoading: false);
      if (kDebugMode) {
        print('Failed to capture image: $e');
      }
    }

    notifyListeners();
  }
}
