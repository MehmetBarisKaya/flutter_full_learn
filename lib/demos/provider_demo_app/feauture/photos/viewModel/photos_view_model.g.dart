// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photos_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PhotosViewModel on _PhotosViewModelBase, Store {
  late final _$photosAtom =
      Atom(name: '_PhotosViewModelBase.photos', context: context);

  @override
  List<PhotoModel> get photos {
    _$photosAtom.reportRead();
    return super.photos;
  }

  @override
  set photos(List<PhotoModel> value) {
    _$photosAtom.reportWrite(value, super.photos, () {
      super.photos = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_PhotosViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$fetchAllPhotosAsyncAction =
      AsyncAction('_PhotosViewModelBase.fetchAllPhotos', context: context);

  @override
  Future<void> fetchAllPhotos() {
    return _$fetchAllPhotosAsyncAction.run(() => super.fetchAllPhotos());
  }

  late final _$_PhotosViewModelBaseActionController =
      ActionController(name: '_PhotosViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_PhotosViewModelBaseActionController.startAction(
        name: '_PhotosViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_PhotosViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
photos: ${photos},
isLoading: ${isLoading}
    ''';
  }
}
