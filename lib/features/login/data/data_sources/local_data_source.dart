import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/login/data/data_sources/login_data_source.dart';
import 'package:e_commerce/features/login/data/models/LoginModel.dart';

class LocalDataSource implements LoginDataSource {
  @override
  Future<Either<Failures, LoginModel>> login(String email,String password) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
