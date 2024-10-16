import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/list_view_with_pagination/post_paggination_model.dart';
import 'package:flutter_template/list_view_with_pagination/post_service.dart';

final postPagginationControllerProvider =
    StateNotifierProvider<PostPagginationController, PostsPaginationModel>(
        (ref) {
  final postService = ref.read(postsServiceProvider);
  return PostPagginationController(postService);
});

class PostPagginationController extends StateNotifier<PostsPaginationModel> {
  PostPagginationController(this._postsService, [PostsPaginationModel? state])
      : super(state ?? PostsPaginationModel.initial());

  final PostsService _postsService;

  void getPosts() async {
    final responce = await _postsService.getPosts(state.pageNo);
    state = state.copyWith(
        posts: [...state.posts, ...responce], pageNo: state.pageNo + 1);
  }

  void checkPageNo(int index) {
    final currentPostion = index + 1;
    final loadNextPage = currentPostion % 20 == 0 && currentPostion > 0;
    final currentPageToRequest = currentPostion / 20;

    if (loadNextPage && currentPageToRequest + 1 > state.pageNo) {
      getPosts();
    }
  }
}
