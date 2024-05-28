import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fullfluttersetup/l10n/l10n.dart';
import 'package:fullfluttersetup/router/router.dart';
import 'package:fullfluttersetup/router/router.gr.dart';

// final navigatorKey s= GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  App({super.key});

  final appRouter = AppRouter();

  // static Future<bool> permission() async =>
  //     await FlutterOverlayWindow.isPermissionGranted();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          // darkTheme: darkTheme,
          // theme: lightTheme,
          // scrollBehavior: ScrollConfiguration.of(context).copyWith(
          //   multitouchDragStrategy: MultitouchDragStrategy.sumAllPointers,
          //   // platform: TargetPlatform.iOS,
          //   // scrollbars: false
          // ),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: appRouter.config(
            navigatorObservers: () => [AutoRouteObserver()],
            deepLinkBuilder: (link) {
              log(link.toString());
              log('${link.path} ------ log');
              if (link.path.contains('/reset')) {
                log('testing');

                return const DeepLink([TimerPageRoute()]);
              } else {
                return DeepLink.defaultPath;
              }
            },
          ),
        );
      },
    );
  }
}
