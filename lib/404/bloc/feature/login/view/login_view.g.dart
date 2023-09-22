part of "./login_view.dart";

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    required GlobalKey<FormState> formLoginKey,
    required TextEditingController emailEditingController,
    required TextEditingController passwordEditingController,
    required String loginText,
  })  : _formLoginKey = formLoginKey,
        _emailEditingController = emailEditingController,
        _passwordEditingController = passwordEditingController,
        _loginText = loginText;

  final GlobalKey<FormState> _formLoginKey;
  final TextEditingController _emailEditingController;
  final TextEditingController _passwordEditingController;
  final String _loginText;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.isComplete) {
          context.route.navigateToPage(const ImageLearn202());
        }
      },
      builder: (context, state) {
        return BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return ElevatedButton(
                onPressed: () {
                  if (_formLoginKey.currentState?.validate() ?? false) {
                    context.read<LoginCubit>().checkUser(
                        _emailEditingController.text,
                        _passwordEditingController.text);
                  }
                },
                child: Padding(
                  padding: const PagePadding.all(),
                  child: Text("$_loginText - ${state.loginModel?.email ?? ""}"),
                ));
          },
        );
      },
    );
  }
}

class _LoginEmailPasswordFields extends StatelessWidget {
  const _LoginEmailPasswordFields({
    Key? key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _emailController = emailController,
        _passwordController = passwordController,
        super(key: key);
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<LoginCubit, LoginState, bool>(
      selector: (state) {
        return state.isLoading;
      },
      builder: (context, state) {
        return IgnorePointer(
          ignoring: state,
          child: AnimatedOpacity(
            duration: context.duration.durationLow,
            opacity: state ? 0.3 : 1,
            child: Column(
              children: [
                Padding(
                  padding: const PagePadding.bottom(),
                  child: TextFormField(
                    controller: _emailController,
                    validator: (String? data) =>
                        (data?.ext.isValidEmail ?? false)
                            ? null
                            : "Enter Email",
                    decoration: const InputDecoration(labelText: "Email"),
                  ),
                ),
                Padding(
                  padding: const PagePadding.bottom(),
                  child: TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: "Password"),
                    validator: (String? data) =>
                        ((data?.length ?? 0) > 6) ? null : "Enter Password",
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class PagePadding extends EdgeInsets {
  const PagePadding.all() : super.all(20);
  const PagePadding.bottom() : super.only(bottom: 10);
}
