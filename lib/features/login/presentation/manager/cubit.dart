import 'package:e_commerce/features/login/data/repositories/login_data_repo.dart';
import 'package:e_commerce/features/login/domain/repositories/login_domain_repo.dart';
import 'package:e_commerce/features/login/domain/use_cases/LoginUseCase.dart';
import 'package:e_commerce/features/login/presentation/manager/states.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_sources/login_data_source.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginDataSource sources;

  LoginCubit(this.sources) : super(LoginInitState());

  static LoginCubit get(context) => BlocProvider.of(context);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  Future<void> login() async {
    emit(LoginLoadingState());
    LoginDomainRepo loginDomainRepo = LoginDataRepo(sources);
    LoginUseCase loginUseCase = LoginUseCase(loginDomainRepo);
    var results =
        await loginUseCase.call(emailController.text, passwordController.text);
    results.fold((l) {

      if (kDebugMode) {
        print(l.message);
      }
      emit(LoginErrorState(l));
    }, (r) {
      emit(LoginSuccessState(r));
    });
  }

// showPassFun() {
//   showPass = !showPass;
//   emit(ShowPassState());
// }
}
