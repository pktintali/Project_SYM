import 'dart:convert';
import 'package:project_sym/models/user.dart';

class MisCard {
  final int id;
  final String? title;
  final String? mistake;
  final String? lesson;
  final bool? commentAllowed;
  final int? likesCount;
  final int? dislikesCount;
  final User? user;
  final String timestamp;
  final bool? isLiked;
  final List? topics;
  MisCard({
    required this.id,
    this.title,
    this.mistake,
    this.lesson,
    this.commentAllowed,
    this.likesCount,
    this.dislikesCount,
    this.user,
    required this.timestamp,
    this.isLiked,
    this.topics,
  });

  MisCard copyWith({
    int? id,
    String? title,
    String? mistake,
    String? lesson,
    bool? commentAllowed,
    int? likesCount,
    int? dislikesCount,
    User? user,
    String? timestamp,
    bool? isLiked,
    List? topics,
  }) {
    return MisCard(
      id: id ?? this.id,
      title: title ?? this.title,
      mistake: mistake ?? this.mistake,
      lesson: lesson ?? this.lesson,
      commentAllowed: commentAllowed ?? this.commentAllowed,
      likesCount: likesCount ?? this.likesCount,
      dislikesCount: dislikesCount ?? this.dislikesCount,
      user: user ?? this.user,
      timestamp: timestamp ?? this.timestamp,
      isLiked: isLiked ?? this.isLiked,
      topics: topics ?? this.topics,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'mistake': mistake,
      'lesson': lesson,
      'commentAllowed': commentAllowed,
      'likesCount': likesCount,
      'dislikesCount': dislikesCount,
      'user': user != null ? user!.toMap() : null,
      'timestamp': timestamp,
      'isLiked': isLiked,
      'topics': topics,
    };
  }

  factory MisCard.fromMap(Map<String, dynamic> map,
      {bool likedByUser = false}) {
    return MisCard(
      id: map['id'],
      title: map['title'],
      mistake: map['mistake'],
      lesson: map['lesson'],
      commentAllowed: map['comment_allowed'],
      likesCount: map['likes_count'],
      dislikesCount: map['dislikes_count'],
      user: map['user'] != null ? User.fromMap(map['user']) : null,
      timestamp: map['created_at'],
      isLiked: likedByUser,
      topics: map['topics'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MisCard.fromJson(String source) =>
      MisCard.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MisCard(id: $id, title: $title, mistake: $mistake, lesson: $lesson, commentAllowed: $commentAllowed, likesCount: $likesCount, dislikesCount: $dislikesCount, user: $user, timestamp: $timestamp, isLiked: $isLiked)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MisCard &&
        other.id == id &&
        other.title == title &&
        other.mistake == mistake &&
        other.lesson == lesson &&
        other.commentAllowed == commentAllowed &&
        other.likesCount == likesCount &&
        other.dislikesCount == dislikesCount &&
        other.user == user &&
        other.timestamp == timestamp;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        mistake.hashCode ^
        lesson.hashCode ^
        commentAllowed.hashCode ^
        likesCount.hashCode ^
        dislikesCount.hashCode ^
        user.hashCode ^
        timestamp.hashCode;
  }
}
