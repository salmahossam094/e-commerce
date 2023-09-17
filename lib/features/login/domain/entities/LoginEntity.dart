// ignore_for_file: must_be_immutable, file_names

import 'package:e_commerce/features/sign_up/domain/entities/sign_up_entity.dart';
import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  LoginEntity({
    this.user,
    this.token,
  });

  UserEntity? user;
  String? token;

  @override
  // TODO: implement props
  List<Object?> get props => [user, token];
}
