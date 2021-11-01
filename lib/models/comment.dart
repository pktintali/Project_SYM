import 'dart:convert';

import 'package:project_sym/models/user.dart';

class Comment {
  final int id;
  final String description;
  final String timeStamp;
  final int likesCount;
  final int dislikesCount;
  final User user;
  Comment({
    required this.id,
    required this.description,
    required this.timeStamp,
    required this.likesCount,
    required this.dislikesCount,
    required this.user,
  });

  Comment copyWith({
    int? id,
    String? description,
    String? timeStamp,
    int? likesCount,
    int? dislikesCount,
    User? user,
  }) {
    return Comment(
      id: id ?? this.id,
      description: description ?? this.description,
      timeStamp: timeStamp ?? this.timeStamp,
      likesCount: likesCount ?? this.likesCount,
      dislikesCount: dislikesCount ?? this.dislikesCount,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'timeStamp': timeStamp,
      'likesCount': likesCount,
      'dislikesCount': dislikesCount,
      'user': user.toMap(),
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      id: map['id'],
      description: map['description'],
      timeStamp: map['created_at'],
      likesCount: map['likes_count'],
      dislikesCount: map['dislikes_count'],
      user: User.fromMap(map['user']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) => Comment.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Comment(id: $id, description: $description, timeStamp: $timeStamp, likesCount: $likesCount, dislikesCount: $dislikesCount, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Comment &&
      other.id == id &&
      other.description == description &&
      other.timeStamp == timeStamp &&
      other.likesCount == likesCount &&
      other.dislikesCount == dislikesCount &&
      other.user == user;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      description.hashCode ^
      timeStamp.hashCode ^
      likesCount.hashCode ^
      dislikesCount.hashCode ^
      user.hashCode;
  }
}
