import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fullfluttersetup/core/themes/darktheme.dart';
import 'package:fullfluttersetup/core/themes/lighttheme.dart';
import 'package:fullfluttersetup/l10n/l10n.dart';
import 'package:fullfluttersetup/router/notifiers.dart';
import 'package:fullfluttersetup/router/route_imports.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          darkTheme: darkTheme,
          theme: lightTheme,
          scrollBehavior: ScrollConfiguration.of(context).copyWith(
            multitouchDragStrategy: MultitouchDragStrategy.sumAllPointers,
            // platform: TargetPlatform.iOS,
            // scrollbars: false
          ),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: AppRouter().config(
            deepLinkBuilder: (deepLink) => deepLink,
            reevaluateListenable: AuthProvider(),
          ),
        );
      },
    );
  }
}
