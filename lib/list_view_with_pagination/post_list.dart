import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/envirment_config.dart';
import 'package:flutter_template/list_view_with_pagination/execption.dart';
import 'package:flutter_template/list_view_with_pagination/post_paggination_controller.dart';
import 'package:flutter_template/list_view_with_pagination/post_service.dart';
import 'package:flutter_template/list_view_with_pagination/posts_data_model.dart';

class PostListScreen extends ConsumerStatefulWidget {
  const PostListScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PostListScreenState();
}

class _PostListScreenState extends ConsumerState<PostListScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(postPagginationControllerProvider.notifier).getPosts();
  }

  @override
  Widget build(BuildContext context) {
    final paginationController = ref.watch(postPagginationControllerProvider);
    final state = ref.watch(postPagginationControllerProvider.notifier);

    return Builder(builder: (context) {
      if (paginationController.error.isNotEmpty) {
        return _ErrorBody(message: paginationController.error.toString());
      }
      if (paginationController.posts.isNotEmpty) {
        return ListView.builder(
          itemCount: paginationController.posts.length,
          itemBuilder: (BuildContext context, int index) {
            ref
                .watch(postPagginationControllerProvider.notifier)
                .checkPageNo(index);

            return ListTile(
              title: Text(paginationController.posts[index].title ?? "NA"),
              subtitle: Text(
                  "ID ${paginationController.posts[index].id} index: $index"),
            );
          },
        );
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}

// class PostListScreen extends ConsumerWidget {
//   const PostListScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final paginationController = ref.watch(postPagginationControllerProvider);
//     final state = ref.watch(postPagginationControllerProvider.notifier);

//     return Builder(builder: (context) {
//       if (paginationController.error.isNotEmpty) {
//         return _ErrorBody(message: paginationController.error.toString());
//       }
//       if (paginationController.posts.isNotEmpty) {
//         return ListView.builder(
//           itemBuilder: (BuildContext context, int index) {
//             ref
//                 .watch(postPagginationControllerProvider.notifier)
//                 .checkPageNo(index);
//             return ListTile(
//               title: Text(paginationController.posts[index].title ?? "NA"),
//             );
//           },
//         );
//       }
//       return Center(
//         child: CircularProgressIndicator(),
//       );
//     });
//     // return posts.when(data: (postsData) {
//     //   return ListView.builder(itemBuilder: (context, index) {
//     //     return ListTile(
//     //       title: Text(postsData[index].title ?? "NA"),
//     //       subtitle: Text(postsData[index].body ?? "NA"),
//     //     );
//     //   });
//     // }, error: (error, trac) {
//     //   if (error is NetworkException) {
//     //     return _ErrorBody(message: error.message ?? "Something went wrong");
//     //   }
//     //   return _ErrorBody(message: "Something went wrong");
//     // }, loading: () {
//     //   return Center(child: CircularProgressIndicator());
//     // });
//   }
// }

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
            onPressed: () => ref.refresh(postPagginationControllerProvider),
            child: const Text("Try again"),
          ),
        ],
      ),
    );
  }
}
