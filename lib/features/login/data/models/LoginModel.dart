// ignore_for_file: must_be_immutable

import 'package:e_commerce/features/login/domain/entities/LoginEntity.dart';

import '../../../sign_up/domain/entities/sign_up_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({
     this.message,
    super.user,
    super.token,
  });

  LoginModel.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  String? message;
}

class User extends UserEntity {
  User({
    super.email,
    super.name,
    this.role,
  });

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }
}
