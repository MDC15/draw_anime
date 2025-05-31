import 'package:flutter/foundation.dart';
import 'user_model.dart';

class UserProvider extends ChangeNotifier {
  UserModel _user = const UserModel(
    id: '1',
    name: 'Anime Artist',
    email: 'artist@example.com',
    avatarUrl: null,
    drawingCount: 0,
    level: 1,
    experience: 0,
  );

  final List<DrawingModel> _drawings = [];

  UserModel get user => _user;
  List<DrawingModel> get drawings => _drawings;

  void updateUser(UserModel user) {
    _user = user;
    notifyListeners();
  }

  void addDrawing(DrawingModel drawing) {
    _drawings.add(drawing);
    _user = _user.copyWith(
      drawingCount: _user.drawingCount + 1,
      experience: _user.experience + 10,
    );
    notifyListeners();
  }

  void deleteDrawing(String drawingId) {
    _drawings.removeWhere((drawing) => drawing.id == drawingId);
    _user = _user.copyWith(
      drawingCount: _user.drawingCount - 1,
    );
    notifyListeners();
  }

  void shareDrawing(String drawingId) {
    // Implementation for sharing drawing
    // This could involve sharing to social media, exporting, etc.
    if (kDebugMode) {
      print('Sharing drawing: $drawingId');
    }
  }
}
