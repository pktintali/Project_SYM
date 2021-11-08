import 'dart:convert';

class User {
  final int id;
  final String userName;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? dateJoined;
  final String? profilePic;
  final bool verified;
  User({
    required this.id,
    required this.userName,
    required this.verified,
    this.firstName,
    this.lastName,
    this.email,
    this.dateJoined,
    this.profilePic,
  });

  User copyWith({
    int? id,
    String? userName,
    String? firstName,
    String? lastName,
    String? email,
    String? dateJoined,
    String? profilePic,
    bool? verified,
  }) {
    return User(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      dateJoined: dateJoined ?? this.dateJoined,
      verified: verified ?? this.verified,
      profilePic: profilePic ?? this.profilePic,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userName': userName,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'date_joined': dateJoined,
      'verified': verified,
      'profile_pic': profilePic,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      userName: map['username'],
      verified: map['verified'],
      firstName: map['first_name'] ?? '',
      lastName: map['last_name'] ?? '',
      email: map['email'] ?? '',
      dateJoined: map['date_joined'] ?? '',
      profilePic: map['profile_pic'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, userName: $userName, firstName: $firstName, lastName: $lastName, email: $email, date_joined: $dateJoined)';
  }
}
