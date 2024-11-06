import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/list_view_with_pagination/post_paggination_model.dart';
import 'package:flutter_template/list_view_with_pagination/post_service.dart';
import 'package:flutter_template/list_view_with_riverpod_generator/data_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_pagination_controller.g.dart';

//Thats how a notifier provider looks like with riverpod generator
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

//With out getnerator
//following code is not used in project
class PostPaginationContollerWithOutGenerator
    extends Notifier<PostsPaginationModel> {
  @override
  PostsPaginationModel build() {
    // TODO: implement build
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

class FormFieldState {
  final String value;
  final String? error;
  final bool isValid;

  FormFieldState({this.value = '', this.error, this.isValid = false});
}

class FormController extends StateNotifier<Map<String, FormFieldState>> {
  FormController() : super({});

  void updateField(String fieldName, String value, String? error) {
    state = {
      ...state,
      fieldName: FormFieldState(
        value: value,
        error: error,
        isValid: error == null,
      ),
    };
  }

  bool get isFormValid {
    return state.values.every((field) => field.isValid);
  }
}

final formControllerProvider =
    StateNotifierProvider<FormController, Map<String, FormFieldState>>(
        (ref) => FormController());

class FormTextField extends ConsumerWidget {
  final String fieldName;
  final String labelText;

  FormTextField({required this.fieldName, required this.labelText});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formController = ref.watch(formControllerProvider);
    final controller =
        TextEditingController(text: formController[fieldName]?.value ?? '');

    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        errorText: formController[fieldName]?.error,
      ),
      onChanged: (value) {
        // Validate and update field
        String? error;
        if (value.isEmpty) {
          error = 'This field cannot be empty';
        }
        ref
            .read(formControllerProvider.notifier)
            .updateField(fieldName, value, error);
      },
    );
  }
}

enum EmailPasswordSigninFormType { registratin, login }

extension EmailPasswordSigninFormTypeExtention on EmailPasswordSigninFormType {
  String get passwordLabelText {
    if (this == EmailPasswordSigninFormType.registratin) {
      return "";
    } else {
      return "";
    }
  }
}
