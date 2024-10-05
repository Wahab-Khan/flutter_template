import 'package:flutter_riverpod/flutter_riverpod.dart';

class EnvironmentConfig {
  //this must be const or its going to return empty string
  //this is just a demo how to get variable from environment file and pass to provider
  //you should pass secret keys to the file and exclude json file from GVC
  final baseURL = const String.fromEnvironment("base_URL");
}

final environmentConfigProvider = Provider<EnvironmentConfig>((ref) {
  return EnvironmentConfig();
});
