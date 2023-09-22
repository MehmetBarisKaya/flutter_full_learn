// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:flutter101/404/bloc/feature/login/model/login_model.dart';
import 'package:flutter101/product/model/token_model.dart';

class LoginState extends Equatable {
  final bool isLoading;
  final LoginModel? loginModel;
  final TokenModel? tokenModel;
  final bool isComplete;
  const LoginState({
    this.isLoading = false,
    this.loginModel,
    this.tokenModel,
    this.isComplete = false,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [isLoading, loginModel];

  LoginState copyWith({
    bool? isLoading,
    LoginModel? loginModel,
    TokenModel? tokenModel,
    bool? isComplete,
  }) {
    return LoginState(
      isLoading: isLoading ?? false,
      loginModel: loginModel ?? this.loginModel,
      tokenModel: tokenModel ?? this.tokenModel,
      isComplete: isComplete ?? false,
    );
  }
}
