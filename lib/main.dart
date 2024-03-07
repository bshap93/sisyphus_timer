import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sisyphus_timer/app/app.dart';
import 'package:sisyphus_timer/app/app_bloc_observer.dart';
import 'package:sisyphus_timer/app/config/app_initializer.dart';
import 'package:sisyphus_timer/app/router/timer_router.dart';
import 'package:sisyphus_timer/constants/app_assets.dart';
import 'package:sisyphus_timer/data/persistence/hive_data_store.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final globalService = await initializeApp();
  final mainRouter = createMainRouter(globalService);
  await AppAssets.preloadSVGs();
  final dataStore = HiveDataStore();
  await dataStore.init();

  runApp(
    createApp(mainRouter, globalService),
  );
}

Future<GlobalService> initializeApp() async {
  late GlobalService globalService;
  if (kIsWeb) {
    globalService = GlobalService(pfType: PlatformType.web);
  } else {
    globalService = GlobalService(pfType: PlatformType.mobile);
  }
  // final globalService = GlobalService(PlatformType.mobile);
  await globalService.initializeApp();
  Bloc.observer = AppBlocObserver(appLogger: globalService.appLogger);
  return globalService;
}

final globalNavigatorKey = GlobalKey<NavigatorState>();

TimerRouter createMainRouter(GlobalService globalService) => TimerRouter(
      navigatorKey: globalNavigatorKey,
    );

Widget createApp(TimerRouter mainRouter, GlobalService globalService) =>
    SisyphusTimerApp(
      sisRouter: mainRouter,
      appLogger: globalService.appLogger,
    );
