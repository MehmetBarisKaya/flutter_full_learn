import 'package:dio/dio.dart';
import 'package:flutter101/303/mobx_learn/core/exception/env_not_found.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class TaskNetworkManager {
  static TaskNetworkManager? _instance;
  static TaskNetworkManager get instance {
    if (_instance != null) return _instance!;
    _instance = TaskNetworkManager._init();
    return _instance!;
  }

  final String _baseUrl = 'BASE_URL';
  late final Dio dio;

  TaskNetworkManager._init() {
    final url = dotenv.env[_baseUrl];
    if (url != null) {
      dio = Dio(BaseOptions(baseUrl: url));
      dio.interceptors.add(PrettyDioLogger());
      dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
        options.path += ".json";
        handler.next(options);
      }));
    } else {
      throw EnvNotFund(_baseUrl);
    }
  }
}
