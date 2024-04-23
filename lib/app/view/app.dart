import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fullfluttersetup/l10n/l10n.dart';
import 'package:fullfluttersetup/modules/observers/throttle_observer.dart';
import 'package:fullfluttersetup/router/router.dart';

// final navigatorKey s= GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  App({super.key});

  final appRouter = AppRouter();

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
          routerConfig: appRouter.config(),
        );
      },
    );
  }
}
