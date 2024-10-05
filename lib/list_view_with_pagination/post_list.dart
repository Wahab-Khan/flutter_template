import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/list_view_with_pagination/post_service.dart';
import 'package:flutter_template/list_view_with_pagination/posts_data_model.dart';

//should be in seprate file
final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

final baseURLProvider = Provider<String>((ref) {
  return "https://jsonplaceholder.typicode.com/posts";
});

final postsProvider = FutureProvider<List<PostsModel>>((ref) async {
  final dio = ref.read(dioProvider);
  final baseURL = ref.read(baseURLProvider);
  return PostsService(dio, baseURL).getPosts();
});

class PostListScreen extends ConsumerWidget {
  const PostListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(postsProvider);
    return posts.when(data: (postsData) {
      return ListView.builder(itemBuilder: (context, index) {
        return ListTile(
          title: Text(postsData[index].title ?? "NA"),
          subtitle: Text(postsData[index].body ?? "NA"),
        );
      });
    }, error: (error, trac) {
      return Center(child: Text(error.toString()));
    }, loading: () {
      return Center(child: CircularProgressIndicator());
    });
  }
}
