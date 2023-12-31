// import 'package:e_commerce/core/error/failures.dart';
// import 'package:e_commerce/features/sign_up/domain/entities/sign_up_entity.dart';
//
// abstract class SignUpStates {}
//
// class SignUpInitState extends SignUpStates {}
//
// class SignUpLoadingState extends SignUpStates {}
//
// class SignUpSuccessState extends SignUpStates {
//   SignUpEntity signUpEntity;
//
//   SignUpSuccessState(this.signUpEntity);
// }
//
// class SignUpErrorState extends SignUpStates {
//   Failures failures;
//
//   SignUpErrorState(this.failures);
// }

import '../../../../core/error/failures.dart';
import '../../domain/entities/sign_up_entity.dart';

abstract class SignUpStates {}

class SignUpInitState extends SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpSuccessState extends SignUpStates {
  SignUpEntity signUpEntity;

  SignUpSuccessState(this.signUpEntity);
}

class SignUpErrorState extends SignUpStates {
  Failures failures;

  SignUpErrorState(this.failures);
}
