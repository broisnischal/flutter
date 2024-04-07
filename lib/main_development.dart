import 'package:flutter/widgets.dart';
import 'package:fullfluttersetup/app/app.dart';
import 'package:fullfluttersetup/bootstrap.dart';
import 'package:fullfluttersetup/di/injection_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

//  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
//   FlutterNativeSplash.remove();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  // await FirebaseApi().init();

  configureDependencies(Env.development);

  await bootstrap(App.new);
}
