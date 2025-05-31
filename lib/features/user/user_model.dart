class UserModel {
  final String id;
  final String name;
  final String email;
  final String? avatarUrl;
  final int drawingCount;
  final int level;
  final int experience;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.avatarUrl,
    this.drawingCount = 0,
    this.level = 1,
    this.experience = 0,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? avatarUrl,
    int? drawingCount,
    int? level,
    int? experience,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      drawingCount: drawingCount ?? this.drawingCount,
      level: level ?? this.level,
      experience: experience ?? this.experience,
    );
  }
}

class DrawingModel {
  final String id;
  final String title;
  final String? thumbnailUrl;
  final DateTime createdAt;
  final List<String> tags;

  const DrawingModel({
    required this.id,
    required this.title,
    this.thumbnailUrl,
    required this.createdAt,
    this.tags = const [],
  });

  DrawingModel copyWith({
    String? id,
    String? title,
    String? thumbnailUrl,
    DateTime? createdAt,
    List<String>? tags,
  }) {
    return DrawingModel(
      id: id ?? this.id,
      title: title ?? this.title,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      createdAt: createdAt ?? this.createdAt,
      tags: tags ?? this.tags,
    );
  }
}
