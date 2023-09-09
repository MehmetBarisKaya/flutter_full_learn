import 'package:flutter101/202/cache/shared_learn_cache.dart';
import 'package:flutter101/303/reqres_users/service/reqres_user_service.dart';
import 'package:flutter101/product/service/project_dio.dart';

import '../model/reqres_user_model.dart';
import '../view/reqres_user_view.dart';

abstract class ReqReqUserViewModel extends LoadingStatefull<ReqResUserView> with ProjectDioMixin {
  late final IReqResUserService _reqResUserService;
  List<Data2>? users;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _reqResUserService = ReqResUserService(service);
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    changeLoading();
    users = (await _reqResUserService.fetchUserItem())?.data ?? [];
    changeLoading();
  }
}
