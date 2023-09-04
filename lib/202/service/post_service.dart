// ignore_for_file: avoid_print

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter101/202/service/comment_model.dart';

import '../model/post_model.dart';

abstract class IPostService {
  Future<bool> additemToService(PostModel postModel);
  Future<bool> putItemToservice(PostModel postModel, int id);
  Future<bool> deleteItemToservice(PostModel postModel, int id);
  Future<List<PostModel>?> fetchPostItemsAdvance();
  Future<List<PostCommentModel>?> fetchRelatedCommentWithPostId(int postId);
}

class PostService implements IPostService {
  late final Dio _networkManager;

  PostService() : _networkManager = Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));

  @override
  Future<bool> additemToService(PostModel postModel) async {
    try {
      final response = await _networkManager.post(_PostServicePath.posts.name, data: postModel);
      return response.statusCode == HttpStatus.ok;
    } on DioException catch (error) {
      _ShowDebug.showDioexception(error, this);
    }
    return false;
  }

  @override
  Future<bool> putItemToservice(PostModel postModel, int id) async {
    try {
      final response = await _networkManager.put("${_PostServicePath.posts.name}/$id", data: postModel);
      return response.statusCode == HttpStatus.ok;
    } on DioException catch (error) {
      _ShowDebug.showDioexception(error, this);
    }
    return false;
  }

  @override
  Future<bool> deleteItemToservice(PostModel postModel, int id) async {
    try {
      final response = await _networkManager.put("${_PostServicePath.posts.name}/$id");
      return response.statusCode == HttpStatus.ok;
    } on DioException catch (error) {
      _ShowDebug.showDioexception(error, this);
    }
    return false;
  }

  @override
  Future<List<PostModel>?> fetchPostItemsAdvance() async {
    try {
      final response = await _networkManager.get(_PostServicePath.posts.name);

      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;
        if (datas is List) {
          return datas.map((e) => PostModel.fromJson(e)).toList();
        }
      }
    } on DioException catch (error) {
      _ShowDebug.showDioexception(error, this);
    }
    return null;
  }

  @override
  Future<List<PostCommentModel>?> fetchRelatedCommentWithPostId(int postId) async {
    try {
      final response = await _networkManager
          .get(_PostServicePath.comments.name, queryParameters: {_PostQueryPath.postId.name: postId});

      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;
        if (datas is List) {
          return datas.map((e) => PostCommentModel.fromJson(e)).toList();
        }
      }
    } on DioException catch (error) {
      _ShowDebug.showDioexception(error, this);
    }
    return null;
  }
}

enum _PostServicePath { posts, comments }

enum _PostQueryPath {
  postId,
}

class _ShowDebug {
  static void showDioexception<T>(DioException error, T type) {
    if (kDebugMode) {
      print(error.message);
      print(type);
    }
  }
}
