import 'package:flutter/material.dart';
import 'package:flutter101/product/global/resource_context.dart';

import '../model/resource_model.dart';
import '../service/reqres_service.dart';

class ReqResProvider extends ChangeNotifier {
  final IReqResService reqResService;
  List<Data> resources = [];

  bool isLoading = false;

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  ReqResProvider(this.reqResService) {
    _fetchResource();
  }

  Future<void> _fetchResource() async {
    _changeLoading();
    resources = (await reqResService.fetchResourceItem())?.data ?? [];
    _changeLoading();
  }

  bool? saveToLocal(ResourceContext resourceContext, List<Data> resources) {
    resourceContext.saveModel(ResourceModel(data: resources));
    return resourceContext.model?.data?.isNotEmpty;
  }
}
