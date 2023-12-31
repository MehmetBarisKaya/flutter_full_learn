import 'package:dio/dio.dart';
import 'package:flutter101/demos/provider_demo_app/core/network/application_constant.dart';
import 'package:flutter101/demos/provider_demo_app/feauture/photos/model/photo_model.dart';
import 'package:flutter101/demos/provider_demo_app/feauture/photos/service/photos_service.dart';
import 'package:mobx/mobx.dart';
part 'photos_view_model.g.dart';

class PhotosViewModel = _PhotosViewModelBase with _$PhotosViewModel;

abstract class _PhotosViewModelBase with Store {
  final Dio _dio =
      Dio(BaseOptions(baseUrl: ApplicationConstant.instance.baseUrl));

  late final IPhotosService photosService;

  @observable
  List<PhotoModel> photos = [];

  @observable
  bool isLoading = false;

  _PhotosViewModelBase() {
    photosService = PhotoService(_dio);
    fetchAllPhotos();
  }

  @action
  Future<void> fetchAllPhotos() async {
    changeLoading();
    final response = await photosService.fetchAllPhotos();
    changeLoading();
    // Logger().f(response);
    photos = response;
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }
}
