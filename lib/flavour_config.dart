enum AppFlavors { prod, dev }

class FlavorConfig {
  final AppFlavors? flavor;
  final String? domainURL;

  static FlavorConfig _instance = FlavorConfig();

  FlavorConfig.setValues(this.flavor, this.domainURL);

  factory FlavorConfig({AppFlavors? flavor, String? domainURL}) {
    _instance = FlavorConfig.setValues(flavor, domainURL);
    return _instance;
  }

  static FlavorConfig get instance {
    return _instance;
  }

  static bool isProd() => _instance.flavor == AppFlavors.prod;
  static bool isDev() => _instance.flavor == AppFlavors.dev;
}
