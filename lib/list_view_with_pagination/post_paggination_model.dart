// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:flutter_template/list_view_with_pagination/posts_data_model.dart';

class PostsPaginationModel {
  final List<PostsModel> posts;
  final int pageNo;
  final String error;

  PostsPaginationModel({
    required this.posts,
    required this.pageNo,
    required this.error,
  });

  PostsPaginationModel.initial()
      : posts = [],
        pageNo = 0,
        error = "";

  PostsPaginationModel copyWith({
    List<PostsModel>? posts,
    int? pageNo,
    String? error,
  }) {
    return PostsPaginationModel(
      posts: posts ?? this.posts,
      pageNo: pageNo ?? this.pageNo,
      error: error ?? this.error,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'posts': posts.map((x) => x.toMap()).toList(),
      'pageNo': pageNo,
      'error': error,
    };
  }

  factory PostsPaginationModel.fromMap(Map<String, dynamic> map) {
    return PostsPaginationModel(
      posts: List<PostsModel>.from(
        (map['posts'] as List<int>).map<PostsModel>(
          (x) => PostsModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      pageNo: map['pageNo'] as int,
      error: map['error'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostsPaginationModel.fromJson(String source) =>
      PostsPaginationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'PostsPaginationModel(posts: $posts, pageNo: $pageNo, error: $error)';

  @override
  bool operator ==(covariant PostsPaginationModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.posts, posts) &&
        other.pageNo == pageNo &&
        other.error == error;
  }

  @override
  int get hashCode => posts.hashCode ^ pageNo.hashCode ^ error.hashCode;
}
