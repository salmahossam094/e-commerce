import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/login/data/data_sources/login_data_source.dart';
import 'package:e_commerce/features/login/domain/entities/LoginEntity.dart';
import 'package:e_commerce/features/login/domain/repositories/login_domain_repo.dart';

class LoginDataRepo implements LoginDomainRepo {
  LoginDataSource sources;

  LoginDataRepo(this.sources);

  @override
  Future<Either<Failures, LoginEntity>> login(String email, String password) =>
      sources.login(email, password);
}
