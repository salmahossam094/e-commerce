import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/core/utils/constants.dart';
import 'package:e_commerce/features/login/data/data_sources/login_data_source.dart';
import 'package:e_commerce/features/login/data/models/LoginModel.dart';

class LoginRemoteDataSource implements LoginDataSource {
  var dio = Dio();

  // @override
  // Future<Either<Failures, LoginModel>> login(
  //     String email, String password) async {
  //   try {
  //     var response = await dio.post(
  //         '${Constants.baseApiUrl},${EndPoints.login}',
  //         data: {"email": email, "password": password});
  //     LoginModel loginModel = LoginModel.fromJson(response.data);
  //     return Right(loginModel);
  //   } catch (e) {
  //     return Left(ServerFailures(e.toString()));
  //   }
  // }
  @override
  Future<Either<Failures, LoginModel>> login(
      String email, String password) async {
    try {
      var response =
          await dio.post("${Constants.baseApiUrl}${EndPoints.login}", data: {
        "email": email,
        "password": password,
      });

      LoginModel loginModel = LoginModel.fromJson(response.data);
      return Right(loginModel);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }
}
