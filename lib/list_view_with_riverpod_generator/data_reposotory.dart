import 'package:dio/dio.dart';
import 'package:flutter_template/list_view_with_pagination/posts_data_model.dart';

class DataReposotory {
  final Dio dio;
  DataReposotory({
    required this.dio,
  });

  Future<List<PostsModel>> getAllPosts() async {
    final responce =
        await dio.get("https://jsonplaceholder.typicode.com/posts");
    final List<dynamic> result = responce.data;
    return result.map((map) => PostsModel.fromMap(map)).toList();
  }

  Future<PostsModel> getPostwithID(int id) async {
    final response =
        await dio.get("https://jsonplaceholder.typicode.com/posts/$id");
    final data = response.data;
    return PostsModel.fromMap(data);
  }
}
