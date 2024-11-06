import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/list_view_with_riverpod_generator/data_detail_view.dart';
import 'package:flutter_template/list_view_with_riverpod_generator/data_provider.dart';

class DataList extends ConsumerStatefulWidget {
  const DataList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DataListState();
}

class _DataListState extends ConsumerState<DataList> {
  @override
  Widget build(BuildContext context) {
    final result = ref.watch(getAllDataProvider);
    return result.when(data: (posts) {
      return ListView.builder(
          itemCount: posts.length,
          itemBuilder: (buildContext, index) {
            return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return DataDetalScreen(posts[index].id!);
                    }),
                  );
                },
                child: ListTile(title: Text(posts[index].title!)));
          });
    }, error: (o, s) {
      return Center(child: Text(o.toString()));
    }, loading: () {
      return Center(child: CircularProgressIndicator());
    });
  }
}
