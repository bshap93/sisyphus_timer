import 'package:flutter/material.dart';
import 'package:sisyphus_timer/constants/app_assets.dart';
import 'package:sisyphus_timer/presentation/home/home_page.dart';
import 'package:sisyphus_timer/presentation/theming/app_theme.dart';

import 'constants/app_colors.dart';
import 'data/persistence/hive_data_store.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppAssets.preloadSVGs();
  final dataStore = HiveDataStore();
  await dataStore.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Times New Roman',
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
        ),
        home: AppTheme(
          data: AppThemeData.defaultWithSwatch(AppColors.aqua),
          child: const HomePage(),
        ),
      );
}
