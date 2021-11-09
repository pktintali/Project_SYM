import 'dart:convert';

class Profile {
  final int id;
  final String? about;
  final String? bannerURL;
  final String? dob;
  final bool impactorBadge;
  final bool adminBadge;
  final bool helperBadge;
  final String? bioLink;
  Profile({
    required this.id,
    this.about,
    this.bannerURL,
    this.dob,
    this.bioLink,
    required this.impactorBadge,
    required this.adminBadge,
    required this.helperBadge,
  });

  Profile copyWith({
    int? id,
    String? about,
    String? bannerURL,
    String? dob,
    bool? impactorBadge,
    bool? adminBadge,
    bool? helperBadge,
    String? bioLink,
  }) {
    return Profile(
      id: id ?? this.id,
      about: about ?? this.about,
      bannerURL: bannerURL ?? this.bannerURL,
      dob: dob ?? this.dob,
      bioLink: bioLink??this.bioLink,
      impactorBadge: impactorBadge ?? this.impactorBadge,
      adminBadge: adminBadge ?? this.adminBadge,
      helperBadge: helperBadge ?? this.helperBadge,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'about': about,
      'banner': bannerURL,
      'dob': dob,
      'impactor_badge': impactorBadge,
      'admin_badge': adminBadge,
      'helper_badge': helperBadge,
      'bio_link': bioLink,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      id: map['id'],
      about: map['about'] ?? '',
      bannerURL: map['banner'] ?? '',
      dob: map['dob'] ?? '',
      bioLink: map['bio_link']??'',
      impactorBadge: map['impactor_badge'],
      adminBadge: map['admin_badge'],
      helperBadge: map['helper_badge'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) =>
      Profile.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Profile(id: $id, about: $about, bannerURL: $bannerURL, dob: $dob, impactorBadge: $impactorBadge, adminBadge: $adminBadge, helperBadge: $helperBadge)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Profile &&
        other.id == id &&
        other.about == about &&
        other.bannerURL == bannerURL &&
        other.dob == dob &&
        other.impactorBadge == impactorBadge &&
        other.adminBadge == adminBadge &&
        other.helperBadge == helperBadge;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        about.hashCode ^
        bannerURL.hashCode ^
        dob.hashCode ^
        impactorBadge.hashCode ^
        adminBadge.hashCode ^
        helperBadge.hashCode;
  }
}
