import 'package:flutter_template/feature/forms/domin/app_user.dart';

/// Fake user class used to simulate a user account on the backend
class FakeAppUser extends AppUser {
  FakeAppUser({
    required super.uid,
    required super.email,
    required this.password,
  });
  final String password;
}
