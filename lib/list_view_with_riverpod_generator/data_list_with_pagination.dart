import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/list_view_with_riverpod_generator/post_pagination_controller.dart';

class PostPagginationListView extends ConsumerStatefulWidget {
  const PostPagginationListView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PostPagginationListViewState();
}

class _PostPagginationListViewState
    extends ConsumerState<PostPagginationListView> {
  @override
  void initState() {
    super.initState();
    ref.read(postPaginationControllerProvider.notifier).getPostsWithPage();
  }

  @override
  Widget build(BuildContext context) {
    print("inside main");
    final result = ref.watch(postPaginationControllerProvider);
    if (result.error.isNotEmpty) {
      return Center(
        child: Text(result.error),
      );
    } else if (result.posts.isNotEmpty) {
      return ListView.builder(
          itemCount: result.posts.length,
          itemBuilder: (context, index) {
            ref
                .read(postPaginationControllerProvider.notifier)
                .getMoreData(index);
            return ListTile(
              title: Text(result.posts[index].title!),
            );
          });
    }

    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
