import 'package:flutter101/202/cache/shared_learn_cache.dart';
import 'package:flutter101/303/reqres_resources/service/reqres_service.dart';
import 'package:flutter101/product/service/project_network_manager.dart';

import '../../../product/service/project_dio.dart';
import '../model/resource_model.dart';
import '../view/reqres_view.dart';

abstract class ReqResViewModel extends LoadingStatefull<ReqResView> with ProjectDioMixin {
  late final IReqResService reqResService;
  List<Data>? resources;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reqResService = ReqResService(ProjectNetworkManager.instance.service);
    ProjectNetworkManager.instance.addBaseHeaderToToken("baris");
    _fetchResource();
  }

  Future<void> _fetchResource() async {
    changeLoading();
    resources = (await reqResService.fetchResourceItem())?.data ?? [];
    changeLoading();
  }
}
