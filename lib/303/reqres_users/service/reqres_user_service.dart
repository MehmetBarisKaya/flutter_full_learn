import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter101/303/reqres_users/model/reqres_user_model.dart';

abstract class IReqResUserService {
  IReqResUserService(this.dio);
  final Dio dio;

  Future<ReqResUserModel?> fetchUserItem();
}

enum _ReqResUserPath { users }

class ReqResUserService extends IReqResUserService {
  ReqResUserService(super.dio);

  @override
  Future<ReqResUserModel?> fetchUserItem() async {
    final response = await dio.get("/${_ReqResUserPath.users.name}");
    if (response.statusCode == HttpStatus.ok) {
      final responseBody = response.data;
      if (responseBody is Map<String, dynamic>) {
        return ReqResUserModel.fromJson(responseBody);
      }
    }
    return null;
  }
}
