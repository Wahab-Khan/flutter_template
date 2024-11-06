import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/list_view_with_riverpod_generator/data_provider.dart';

class DataDetalScreen extends ConsumerWidget {
  const DataDetalScreen(this.articleId, {super.key});

  final int articleId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postData = ref.watch(getPostAtProvider(postId: articleId));
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail View"),
      ),
      body: postData.when(data: (data) {
        return Center(
          child: Text(data.body!),
        );
      }, error: (e, s) {
        return Center(
          child: Text(e.toString()),
        );
      }, loading: () {
        return Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
