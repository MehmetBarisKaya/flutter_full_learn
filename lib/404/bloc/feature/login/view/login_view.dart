// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter101/202/image_learn_202.dart';
import 'package:flutter101/404/bloc/feature/login/cubit/login_cubit_state.dart';
import 'package:flutter101/404/bloc/feature/login/service/login_service.dart';
import 'package:flutter101/product/service/vexana_network_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import 'package:flutter101/404/bloc/feature/login/cubit/login_cubit.dart';

part 'login_view.g.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_declarations
    final _loginText = "Login";
    TextEditingController _emailEditingController = TextEditingController();
    TextEditingController _passwordEditingController = TextEditingController();

    final GlobalKey<FormState> _formLoginKey = GlobalKey();
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(LoginService(VexananetworkManager())),
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return state.isLoading
                  ? CircularProgressIndicator(
                      color: context.general.colorScheme.secondary,
                    )
                  : const SizedBox.shrink();
            },
          ),
        ),
        body: Form(
          key: _formLoginKey,
          autovalidateMode: AutovalidateMode.always,
          child: Padding(
            padding: const PagePadding.all(),
            child: Column(
              children: [
                _LoginEmailPasswordFields(
                  emailController: _emailEditingController,
                  passwordController: _passwordEditingController,
                ),
                _LoginButton(
                    formLoginKey: _formLoginKey,
                    emailEditingController: _emailEditingController,
                    passwordEditingController: _passwordEditingController,
                    loginText: _loginText)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
