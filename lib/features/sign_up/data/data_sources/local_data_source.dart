import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/sign_up/data/data_sources/sign_up_data_source.dart';
import 'package:e_commerce/features/sign_up/data/models/sign_up_model.dart';
import 'package:e_commerce/features/sign_up/domain/entities/user_data.dart';

class SignUpLocalDataSource extends SignUpDataSources {
  @override
  Future<Either<Failures, SignUpModel>> signUp(UserData userData) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
