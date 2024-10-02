enum AppFlavors { prod, dev }

class FlavorConfig {
  final AppFlavors? flavor;
  final String? domainURL;
  final String? apiSecreatKey;

  static FlavorConfig _instance = FlavorConfig();

  FlavorConfig.setValues(this.flavor, this.domainURL, this.apiSecreatKey);

  factory FlavorConfig(
      {AppFlavors? flavor, String? domainURL, String? apiKey}) {
    _instance = FlavorConfig.setValues(flavor, domainURL, apiKey);
    return _instance;
  }

  static FlavorConfig get instance {
    return _instance;
  }

  static bool isProd() => _instance.flavor == AppFlavors.prod;
  static bool isDev() => _instance.flavor == AppFlavors.dev;
}
