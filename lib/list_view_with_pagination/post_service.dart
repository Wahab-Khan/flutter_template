import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/envirment_config.dart';
import 'package:flutter_template/list_view_with_pagination/execption.dart';
import 'package:flutter_template/list_view_with_pagination/posts_data_model.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

final postsServiceProvider = Provider<PostsService>((ref) {
  final dio = ref.read(dioProvider);
  final environmentConfig = ref.read(environmentConfigProvider);
  return PostsService(dio, environmentConfig.baseURL);
});

class PostsService {
  final Dio _dio;
  final String _postsURL;

  PostsService(this._dio, this._postsURL);

  //should be users model
  Future<List<PostsModel>> getPosts(int pageNo) async {
    try {
      final url = "$_postsURL?_start=$pageNo&_limit=20";
      final response = await _dio.get(url);
      // final List<dynamic> data = response.data;
      // return data.map((json) => PostsModel.fromMap(json)).toList();
      final List<dynamic> data = response.data;
      return data.map((json) => PostsModel.fromMap(json)).toList();
    } on DioException catch (e) {
      throw NetworkException.fromDioError(e);
    }
  }
}
