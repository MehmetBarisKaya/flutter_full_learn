import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter101/202/model/post_model.dart';
import 'package:flutter101/202/service/comment_learn_view.dart';
import 'package:flutter101/202/service/post_service.dart';

class ServiceLearn extends StatefulWidget {
  const ServiceLearn({super.key});

  @override
  State<ServiceLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServiceLearn> {
  List<PostModel>? _items;
  bool _isLoading = false;
  late final Dio _networkManager;
  final _baseUrl = "https://jsonplaceholder.typicode.com/";

  //test edilebilir
  late final IPostService _postService;

  @override
  void initState() {
    super.initState();
    _networkManager = Dio(BaseOptions(baseUrl: _baseUrl));
    _postService = PostService();
    fetchPostItemsAdvance();
  }

  void changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  void fetchPostItems() async {
    changeLoading();
    final response =
        await Dio().get("https://jsonplaceholder.typicode.com/posts");

    if (response.statusCode == HttpStatus.ok) {
      final myItems = response.data;
      if (myItems is List) {
        _items = myItems.map((e) => PostModel.fromJson(e)).toList();
      }
    }

    changeLoading();
  }

  void fetchPostItemsAdvance() async {
    changeLoading();
    _items = await _postService.fetchPostItemsAdvance();

    changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          _isLoading
              ? const CircularProgressIndicator.adaptive()
              : const SizedBox.shrink()
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: _items?.length ?? 0,
        itemBuilder: (context, index) {
          return _PostCard(model: _items?[index]);
        },
      ),
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({
    required PostModel? model,
  }) : _model = model;

  final PostModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CommentLearnView(postId: _model?.id),
          ));
        },
        title: Text(_model?.title ?? ""),
        subtitle: Text(_model?.body ?? ""),
      ),
    );
  }
}
