import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? id;
  String? email;
  String? password;

  UserModel({this.id, this.email, this.password});

  UserModel.fromFirebaseUser(User user)
      : id = user.uid,
        email = user.email,
        password = ''; 

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      password: json['password'],
    );
  }
}
