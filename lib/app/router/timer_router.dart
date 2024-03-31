import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:sisyphus_timer/presentation/home/home_page.dart';
import 'package:sisyphus_timer/presentation/timer/simple_timer/simple_timer_page.dart';

class TimerRouter {
  TimerRouter({
    required this.navigatorKey,
    this.initialLocation,
  }) {
    _goRouter = GoRouter(
      initialLocation: initialLocation ?? '/',
      navigatorKey: navigatorKey,
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/simple-timer',
          builder: (context, state) =>
          const SimpleTimerPage(
            timerId: '1',
          ),
        ),
      ],
    );
  }
  late GoRouter _goRouter;

  GoRouter get goRouter => _goRouter;

  final GlobalKey<NavigatorState> navigatorKey;
  final String? initialLocation;
}
