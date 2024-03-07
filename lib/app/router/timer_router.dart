import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:sisyphus_timer/presentation/home/home_page.dart';
import 'package:sisyphus_timer/presentation/timer/simple_timer/simple_timer_page.dart';

class TimerRouter extends GoRouter {
  TimerRouter({
    required this.navigatorKey,
    this.initialLocation,
  }) : super(
          initialLocation: initialLocation ?? '/',
          navigatorKey: navigatorKey,
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const HomePage(),
            ),
            GoRoute(
              path: '/simple-timer',
              builder: (context, state) => const SimpleTimerPage(
                timerId: '1',
              ),
            ),
          ],
        );

  final GlobalKey<NavigatorState> navigatorKey;
  final String? initialLocation;
}
