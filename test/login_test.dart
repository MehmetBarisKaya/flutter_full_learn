import 'package:flutter101/404/bloc/feature/login/model/login_model.dart';
import 'package:flutter101/404/bloc/feature/login/service/login_service.dart';
import 'package:flutter101/product/service/vexana_network_manager.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late LoginService loginService;
  setUp(() {
    // ignore: prefer_void_to_null
    loginService = LoginService(VexananetworkManager());
  });

  test("Login - test", () async {
    final response = await loginService
        .login(LoginModel("eve.holt@reqres.in", "cityslicka"));
    expect(response.data, isNotNull);
  });
}
