import 'package:flutter/material.dart';
import 'package:sisyphus_timer/app/app_logger.dart';
import 'package:sisyphus_timer/app/router/timer_router.dart';
import 'package:sisyphus_timer/constants/app_colors.dart';
import 'package:sisyphus_timer/presentation/theming/app_theme.dart';

void dismissKeyboard(BuildContext context) {
  final FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
  }
}

class SisyphusTimerApp extends StatelessWidget {
  const SisyphusTimerApp({
    required this.sisRouter,
    required this.appLogger,
    super.key,
  });

  final TimerRouter sisRouter;
  final AppLogger appLogger;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => dismissKeyboard(context),
        child: AppTheme(
          data: AppThemeData.defaultWithSwatch(AppColors.aqua),
          child: MaterialApp.router(
            title: 'Sisyphus Timer',
            routeInformationParser: sisRouter.goRouter.routeInformationParser,
            routeInformationProvider: sisRouter.goRouter.routeInformationProvider,
            backButtonDispatcher: sisRouter.goRouter.backButtonDispatcher,
            routerDelegate: sisRouter.goRouter.routerDelegate,
            theme: ThemeData(
              fontFamily: 'Times New Roman',
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
            ),
            // home: AppTheme(
            //   data: AppThemeData.defaultWithSwatch(AppColors.aqua),
            //   child: const HomePage(),
            // ),
          ),
        ),
      );
}
