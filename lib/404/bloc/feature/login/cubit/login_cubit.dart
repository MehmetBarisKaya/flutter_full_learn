// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter101/404/bloc/feature/login/cubit/login_cubit_state.dart';
import 'package:flutter101/404/bloc/feature/login/model/login_model.dart';
import 'package:flutter101/404/bloc/feature/login/service/login_service.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
    ILoginService loginService,
  )   : _loginService = loginService,
        super(const LoginState());

  final ILoginService _loginService;

  Future<void> checkUser(String email, String password) async {
    emit(state.copyWith(
        isLoading: true, loginModel: LoginModel(email, password)));
    final response = await _loginService.login(state.loginModel!);
    //await Future.delayed(const Duration(seconds: 1));

    emit(state.copyWith(isLoading: false, isComplete: response.data != null));
  }
}
