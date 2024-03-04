import 'package:go_router/go_router.dart';
import 'package:sisyphus_timer/presentation/home/home_page.dart';
import 'package:sisyphus_timer/presentation/timer/simple_timer/simple_timer_page.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      Routes.home,
    ],
  );
}

class Routes {
  static final home = GoRoute(
    path: '/',
    name: 'home',
    routes: [
      GoRoute(
        path: 'simpletimer/:timerId',
        builder: (context, state) => const HomePage(),
        name: 'notifications',
      ),
    ],
    builder: (context, state) {
      final timerId = state.pathParameters['timerId'];
      if (timerId == null) {
        return const HomePage();
      } else {
        return SimpleTimerPage(
          timerId: timerId,
        );
      }
    },
  );
}
