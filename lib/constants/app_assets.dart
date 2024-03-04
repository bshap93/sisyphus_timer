import 'package:flutter_svg/flutter_svg.dart';

class AppAssets {
  static const check = 'assets/check.svg';
  static const plus = 'assets/plus.svg';
  static const hillJourney = 'assets/hill_journey.svg';

  static const allTimerIcons = [];

  static Future<void> preloadSVGs() async {
    final assets = [];
    for (int i = 0; i < assets.length; i++) {
      final asset = assets[i];
      final loader = SvgAssetLoader(asset);
      await svg.cache
          .putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
    }
  }
}
