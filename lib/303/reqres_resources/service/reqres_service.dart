import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter101/303/reqres_resources/model/resource_model.dart';

abstract class IReqResService {
  IReqResService(this.dio);
  final Dio dio;
  Future<ResourceModel?> fetchResourceItem();
}

enum _ReqResPath { unknown }

class ReqResService extends IReqResService {
  ReqResService(super.dio);

  @override
  Future<ResourceModel?> fetchResourceItem() async {
    final response = await dio.get("/${_ReqResPath.unknown.name}");
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return ResourceModel.fromJson(jsonBody);
      }
    }
    return null;
  }
}
