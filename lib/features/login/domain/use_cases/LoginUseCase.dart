// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/login/domain/entities/LoginEntity.dart';
import 'package:e_commerce/features/login/domain/repositories/login_domain_repo.dart';

class LoginUseCase {
  LoginDomainRepo loginDomainRepo;

  LoginUseCase(this.loginDomainRepo);

  Future<Either<Failures, LoginEntity>> call(String email, String password) =>
      loginDomainRepo.login(email, password);
}
