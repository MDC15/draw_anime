import 'package:flutter/material.dart';

class ArModel {
  final bool isLoading;
  final bool isCameraInitialized;
  final AnimeImageModel? selectedAnimeImage;
  final List<Offset> drawingPoints;

  const ArModel({
    this.isLoading = false,
    this.isCameraInitialized = false,
    this.selectedAnimeImage,
    this.drawingPoints = const [],
  });

  ArModel copyWith({
    bool? isLoading,
    bool? isCameraInitialized,
    AnimeImageModel? selectedAnimeImage,
    List<Offset>? drawingPoints,
  }) {
    return ArModel(
      isLoading: isLoading ?? this.isLoading,
      isCameraInitialized: isCameraInitialized ?? this.isCameraInitialized,
      selectedAnimeImage: selectedAnimeImage ?? this.selectedAnimeImage,
      drawingPoints: drawingPoints ?? this.drawingPoints,
    );
  }
}

class AnimeImageModel {
  final String id;
  final String url;
  final String title;
  final String style;
  final Map<String, dynamic> metadata;

  const AnimeImageModel({
    required this.id,
    required this.url,
    required this.title,
    required this.style,
    this.metadata = const {},
  });

  AnimeImageModel copyWith({
    String? id,
    String? url,
    String? title,
    String? style,
    Map<String, dynamic>? metadata,
  }) {
    return AnimeImageModel(
      id: id ?? this.id,
      url: url ?? this.url,
      title: title ?? this.title,
      style: style ?? this.style,
      metadata: metadata ?? this.metadata,
    );
  }
}
