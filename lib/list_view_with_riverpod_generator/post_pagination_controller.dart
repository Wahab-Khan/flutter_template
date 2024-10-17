import 'package:dio/dio.dart';
import 'package:flutter_template/list_view_with_pagination/post_paggination_model.dart';
import 'package:flutter_template/list_view_with_pagination/post_service.dart';
import 'package:flutter_template/list_view_with_riverpod_generator/data_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_pagination_controller.g.dart';

@riverpod
class PostPaginationController extends _$PostPaginationController {
  @override
  PostsPaginationModel build() {
    return PostsPaginationModel.initial();
  }

  void getPostsWithPage() async {
    final result =
        await ref.read(getDataRepoProvider).getPostWithPage(state.pageNo);
    print(state.pageNo);
    state = state.copyWith(posts: [...state.posts, ...result]);
  }

  void getMoreData(int index) {
    final currentPosition = index + 1;
    final loadMore = currentPosition % 10 == 0 && index != 0;
    final int currentPageToRequest = currentPosition ~/ 10;

    if (loadMore && currentPageToRequest > state.pageNo) {
      state.copyWith(pageNo: state.pageNo + 1);
      getPostsWithPage();
    }
  }
}
