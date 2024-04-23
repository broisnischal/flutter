import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:fullfluttersetup/app/app.dart';
import 'package:fullfluttersetup/bootstrap.dart';
import 'package:fullfluttersetup/di/injection_config.dart';
import 'package:fullfluttersetup/modules/observers/throttle_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  //   FlutterNativeSplash.remove();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  // await FirebaseApi().init();

  Bloc.observer = ThrottlingBlocObserver(
    throttleDuration: const Duration(milliseconds: 500),
  );

  configureDependencies(Env.development);

  try {
    await FlutterDisplayMode.setHighRefreshRate();
  } catch (e) {
    log(e.toString());
  }

  await bootstrap(App.new);
}
