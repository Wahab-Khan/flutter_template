import 'package:dio/dio.dart';
import 'package:flutter_template/list_view_with_pagination/posts_data_model.dart';

class PostsService {
  final Dio _dio;
  final String _postsURL;

  PostsService(this._dio, this._postsURL);

  //should be users model
  Future<List<PostsModel>> getPosts() async {
    final response = await _dio.get(_postsURL);
    // final result = postModelFromJson(response.data);
    if (response.statusCode == 200) {
      // final List<dynamic> data = response.data;
      // return data.map((json) => PostsModel.fromMap(json)).toList();
      final List<dynamic> data = response.data;
      return data.map((json) => PostsModel.fromMap(json)).toList();
      return postModelFromData(response.data);
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
