import 'data/network/endpoints.dart';

enum Flavor { dev, prod }

class FlavorConfig {
  final Flavor flavor;
  static FlavorConfig? _flavorConfig;

  static FlavorConfig get _instance => _flavorConfig!;

  factory FlavorConfig({
    required Flavor flavor,
  }) {
    _flavorConfig ??= FlavorConfig._internal(
      flavor,
    );
    return _instance;
  }

  FlavorConfig._internal(
    this.flavor,
  );

  static String get currentFlavorName {
    switch (_instance.flavor) {
      case Flavor.prod:
        return 'Prod';
      default:
        return 'Dev';
    }
  }

  static String getRawName(Flavor flavor) {
    switch (flavor) {
      case Flavor.prod:
        return 'prod';
      default:
        return 'dev';
    }
  }

  static Flavor getFlavorFromRawName(String rawName) {
    switch (rawName) {
      case 'prod':
        return Flavor.prod;
      default:
        return Flavor.dev;
    }
  }

  String get baseUrl {
    switch (_instance.flavor) {
      case Flavor.prod:
        return BaseUrl.prod;
      default:
        return BaseUrl.dev;
    }
  }

  static FlavorConfig get instance {
    return _instance;
  }

  static bool isProduction() => _instance.flavor == Flavor.prod;

  static bool isDevelopment() => _instance.flavor == Flavor.dev;
}
