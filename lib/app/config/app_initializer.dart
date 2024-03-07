import 'package:sisyphus_timer/app/app_logger.dart';

enum PlatformType { mobile, android, ios, web, mock }

class GlobalService {
  var userRepository;

  var appEventBus;

  factory GlobalService({
    required PlatformType pfType,
  }) =>
      _instance;
  GlobalService._internal();

  final AppLogger appLogger = AppLogger();
  static final GlobalService _instance = GlobalService._internal();

  Future<void> initializeApp() async {
    await initLocalStorage();
  }
}

Future<void> initLocalStorage() async {}
