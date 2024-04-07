import 'package:fullfluttersetup/di/injection_config.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies(String env) {
  $initGetIt(getIt, environment: env);
}

abstract class Env {
  static const development = 'development';
  static const production = 'production';
  static const staging = 'staging';
}
