import 'package:bloc/bloc.dart';
import 'package:sisyphus_timer/app/app_logger.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver({required this.appLogger});

  final AppLogger appLogger;

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    appLogger.logInfo(event.toString());
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    appLogger.logError(
      message: error.toString(),
      error: error,
      stackTrace: stackTrace,
    );
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);

    appLogger.logInfo(change);
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    appLogger.logInfo(transition.event.toString());
  }
}
