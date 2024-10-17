import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_template/list_view_with_pagination/execption.dart';
import 'package:flutter_template/list_view_with_pagination/posts_data_model.dart';

class DataReposotory {
  final Dio dio;
  DataReposotory({
    required this.dio,
  });

  Future<List<PostsModel>> getAllPosts() async {
    try {
      final response =
          await dio.get("https://jsonplaceholder.typicode.com/posts");
      final List<dynamic> result = response.data;
      return result.map((map) => PostsModel.fromMap(map)).toList();
    } on DioException catch (e) {
      throw NetworkException.fromDioError(e);
    }
  }

  Future<PostsModel> getPostwithID(int id) async {
    try {
      final response =
          await dio.get("https://jsonplaceholder.typicode.com/posts/$id");
      final data = response.data;
      return PostsModel.fromMap(data);
    } on DioException catch (e) {
      throw NetworkException.fromDioError(e);
    }
  }

  Future<List<PostsModel>> getPostWithPage(int pageNo) async {
    try {
      final response = await dio.get(
          "https://jsonplaceholder.typicode.com/posts?_start=${pageNo}&_limit=10");
      final List<dynamic> result = response.data;
      return result.map((map) => PostsModel.fromMap(map)).toList();
    } on DioException catch (e) {
      throw NetworkException.fromDioError(e);
    }
  }
}
