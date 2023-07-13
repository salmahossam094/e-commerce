import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/login/data/models/LoginModel.dart';

abstract class LoginDataSource {
  Future<Either<Failures, LoginModel>> login(String email,String password);
}
