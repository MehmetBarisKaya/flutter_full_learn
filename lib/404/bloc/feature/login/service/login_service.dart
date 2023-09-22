import 'package:flutter101/404/bloc/feature/login/model/login_model.dart';
import 'package:flutter101/product/model/token_model.dart';
import 'package:vexana/vexana.dart';

abstract class ILoginService {
  final INetworkManager networkManager;
  ILoginService(this.networkManager);
  final String _loginPath = 'api/login';
  Future<IResponseModel<TokenModel?, INetworkModel<dynamic>?>> login(
      LoginModel model);
}

class LoginService extends ILoginService {
  LoginService(super.networkManager);

  @override
  Future<IResponseModel<TokenModel?, INetworkModel<dynamic>?>> login(
      LoginModel model) async {
    return await networkManager.send<TokenModel, TokenModel>(_loginPath,
        parseModel: TokenModel(), method: RequestType.POST, data: model);
  }
}
