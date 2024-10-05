import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/envirment_config.dart';
import 'package:flutter_template/list_view_with_pagination/execption.dart';
import 'package:flutter_template/list_view_with_pagination/post_service.dart';
import 'package:flutter_template/list_view_with_pagination/posts_data_model.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

final postsProvider = FutureProvider<List<PostsModel>>((ref) async {
  final dio = ref.read(dioProvider);
  final environmentConfig = ref.read(environmentConfigProvider);
  return PostsService(dio, environmentConfig.baseURL).getPosts();
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
      if (error is NetworkException) {
        return _ErrorBody(message: error.message ?? "Something went wrong");
      }
      return _ErrorBody(message: "Something went wrong");
    }, loading: () {
      return Center(child: CircularProgressIndicator());
    });
  }
}

class _ErrorBody extends ConsumerWidget {
  const _ErrorBody({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          ElevatedButton(
            onPressed: () => ref.refresh(postsProvider),
            child: const Text("Try again"),
          ),
        ],
      ),
    );
  }
}
