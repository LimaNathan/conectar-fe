// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserDetails {
  int? sub;
  String? email;
  String? role;
  String? name;
  UserDetails({this.sub, this.email, this.role, this.name});

  UserDetails copyWith({int? sub, String? email, String? role, String? name}) {
    return UserDetails(
      sub: sub ?? this.sub,
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sub': sub,
      'email': email,
      'role': role,
      'name': name,
    };
  }

  factory UserDetails.fromMap(Map<String, dynamic> map) {
    return UserDetails(
      sub: map['sub'] != null ? map['sub'] as int : null,
      email: map['email'] != null ? map['email'] as String : null,
      role: map['role'] != null ? map['role'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDetails.fromJson(String source) =>
      UserDetails.fromMap(json.decode(source) as Map<String, dynamic>);
}
