import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/list_view_with_pagination/post_service.dart';
import 'package:flutter_template/list_view_with_riverpod_generator/data_reposotory.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_template/list_view_with_pagination/posts_data_model.dart';

part 'data_provider.g.dart';

@riverpod
DataReposotory getDataRepo(Ref ref) {
  return DataReposotory(dio: ref.read(dioProvider));
}

@riverpod
Future<List<PostsModel>> getAllData(Ref ref) {
  final dataRepo = ref.read(getDataRepoProvider);
  return dataRepo.getAllPosts();
}

@riverpod
Future<PostsModel> getPostAt(Ref ref, {required int postId}) {
  return ref.read(getDataRepoProvider).getPostwithID(postId);
}
