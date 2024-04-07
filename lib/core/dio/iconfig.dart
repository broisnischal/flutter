import 'package:fullfluttersetup/core/constants/apiconstant.dart';
import 'package:fullfluttersetup/di/injection_config.dart';
import 'package:injectable/injectable.dart';

abstract class IConfig {
  String get baseUrl;
  // String get imageUrl;

  Map<String, String> get headers;
}

@Environment(Env.development)
@Singleton(as: IConfig)
class DevConfig implements IConfig {
  @override
  String get baseUrl => BaseURI.baseUrl;

  @override
  Map<String, String> get headers => {};
}

@Environment(Env.staging)
@Singleton(as: IConfig)
class StagingConfig implements IConfig {
  @override
  String get baseUrl => BaseURI.stagingBaseUrl;

  @override
  Map<String, String> get headers => {};
}

@Environment(Env.production)
@Singleton(as: IConfig)
class ProdConfig implements IConfig {
  @override
  String get baseUrl => BaseURI.prodBaseUrl;

  @override
  Map<String, String> get headers => {};
}
