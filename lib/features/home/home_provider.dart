import 'package:flutter/material.dart';
import 'home_model.dart';

class HomeProvider extends ChangeNotifier {
  HomeModel _model = const HomeModel();

  HomeModel get model => _model;
  List<DrawingPoint> get drawings => _model.drawings;
  DrawingTool get currentTool => _model.currentTool;
  Color get currentColor => _model.currentColor;
  bool get canUndo => _model.undoStack.isNotEmpty;
  bool get canRedo => _model.redoStack.isNotEmpty;

  void addDrawing(DrawingPoint point) {
    final newDrawings = [..._model.drawings, point];
    _model = _model.copyWith(
      drawings: newDrawings,
      undoStack: [..._model.undoStack, _model.drawings],
      redoStack: [], // Clear redo stack when new action is performed
    );
    notifyListeners();
  }

  void setCurrentTool(DrawingTool tool) {
    _model = _model.copyWith(currentTool: tool);
    notifyListeners();
  }

  void setCurrentColor(Color color) {
    _model = _model.copyWith(currentColor: color);
    notifyListeners();
  }

  void undo() {
    if (_model.undoStack.isNotEmpty) {
      final previousState = _model.undoStack.last;
      final newUndoStack = [..._model.undoStack]..removeLast();

      _model = _model.copyWith(
        drawings: previousState,
        undoStack: newUndoStack,
        redoStack: [..._model.redoStack, _model.drawings],
      );
      notifyListeners();
    }
  }

  void redo() {
    if (_model.redoStack.isNotEmpty) {
      final nextState = _model.redoStack.last;
      final newRedoStack = [..._model.redoStack]..removeLast();

      _model = _model.copyWith(
        drawings: nextState,
        undoStack: [..._model.undoStack, _model.drawings],
        redoStack: newRedoStack,
      );
      notifyListeners();
    }
  }

  void clearCanvas() {
    _model = _model.copyWith(
      drawings: [],
      undoStack: [..._model.undoStack, _model.drawings],
      redoStack: [],
    );
    notifyListeners();
  }
}
