import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter101/demos/provider_demo_app/feauture/photos/model/photo_model.dart';

part 'photo_service_path.dart';

abstract class IPhotosService {
  final Dio dio;

  IPhotosService(this.dio);

  Future<List<PhotoModel>> fetchAllPhotos();
}

class PhotoService extends IPhotosService {
  PhotoService(Dio dio) : super(dio);

  @override
  Future<List<PhotoModel>> fetchAllPhotos() async {
    final response = await dio.get(_PhotoServicePath.PHOTOS.rawValue);
    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;
      if (data is List) {
        return data.map((e) => PhotoModel.fromJson(e)).toList();
      }
    }
    return [];
  }
}
