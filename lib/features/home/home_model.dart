import 'package:flutter/material.dart';

enum DrawingTool { brush, eraser }

class DrawingPoint {
  final Offset point;
  final Color color;
  final double strokeWidth;
  final DrawingTool tool;

  const DrawingPoint({
    required this.point,
    required this.color,
    this.strokeWidth = 3.0,
    this.tool = DrawingTool.brush,
  });
}

class HomeModel {
  final List<DrawingPoint> drawings;
  final DrawingTool currentTool;
  final Color currentColor;
  final List<List<DrawingPoint>> undoStack;
  final List<List<DrawingPoint>> redoStack;

  const HomeModel({
    this.drawings = const [],
    this.currentTool = DrawingTool.brush,
    this.currentColor = Colors.black,
    this.undoStack = const [],
    this.redoStack = const [],
  });

  HomeModel copyWith({
    List<DrawingPoint>? drawings,
    DrawingTool? currentTool,
    Color? currentColor,
    List<List<DrawingPoint>>? undoStack,
    List<List<DrawingPoint>>? redoStack,
  }) {
    return HomeModel(
      drawings: drawings ?? this.drawings,
      currentTool: currentTool ?? this.currentTool,
      currentColor: currentColor ?? this.currentColor,
      undoStack: undoStack ?? this.undoStack,
      redoStack: redoStack ?? this.redoStack,
    );
  }
}
