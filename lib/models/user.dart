import 'dart:convert';

class User {
  final int id;
  final String userName;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? dateJoined;
  User({
    required this.id,
    required this.userName,
    this.firstName,
    this.lastName,
    this.email,
    this.dateJoined,
  });

  User copyWith({
    int? id,
    String? userName,
    String? firstName,
    String? lastName,
    String? email,
    String? dateJoined,
  }) {
    return User(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      dateJoined: dateJoined ?? this.dateJoined,
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
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      userName: map['username'],
      firstName: map['first_name']??'',
      lastName: map['last_name']??'',
      email: map['email']??'',
      dateJoined: map['dateJoined']??'',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, userName: $userName, firstName: $firstName, lastName: $lastName, email: $email, date_joined: $dateJoined)';
  }

}
