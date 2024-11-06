import 'dart:async';

import 'package:flutter_template/feature/forms/data/fake_auth_repository.dart';
import 'package:flutter_template/feature/forms/presentation/auth_form_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class EmailPasswordSignInController extends _$EmailPasswordSignInController {
  @override
  FutureOr<void> build() {
    // nothing to do
  }
  Future<bool> submit(
      {required String email,
      required String password,
      required AuthFormType formType}) async {
    state = const AsyncValue.loading();
    state =
        await AsyncValue.guard(() => _authenticate(email, password, formType));
    return state.hasError == false;
  }

  Future<void> _authenticate(
      String email, String password, AuthFormType formType) {
    final authRepository = ref.read(authRepositoryProvider);
    switch (formType) {
      case AuthFormType.login:
        return authRepository.signInWithEmailAndPassword(email, password);
      case AuthFormType.registration:
        return authRepository.createUserWithEmailAndPassword(email, password);
    }
  }
}
