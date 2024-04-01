import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sisyphus_timer/constants/app_assets.dart';
import 'package:sisyphus_timer/presentation/theming/app_theme.dart';
import 'package:sisyphus_timer/presentation/timer/timer_completion_ring.dart';
import 'package:sisyphus_timer/presentation/widgets/centered_svg_icon.dart';

class AnimatedTimer extends StatefulWidget {
  const AnimatedTimer({
    required this.iconName,
    this.completed,
    super.key,
    this.onCompleted,
    required this.tag,
  });
  final String iconName;
  final bool? completed;
  final ValueChanged<bool>? onCompleted;
  final String tag;

  @override
  State<AnimatedTimer> createState() => _AnimatedTimerState();
}

class _AnimatedTimerState extends State<AnimatedTimer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _curveAnimation;
  bool _showCheckIcon = false;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    _animationController.addStatusListener(_checkStatusUpdates);
    _curveAnimation = _animationController.drive(
      CurveTween(curve: Curves.linear),
    );
    _handleInitialBehavior();

  }

  @override
  void dispose() {
    _animationController.removeStatusListener(_checkStatusUpdates);

    _animationController.dispose();


    super.dispose();
  }

  void _checkStatusUpdates(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      widget.onCompleted?.call(true);
      if (mounted) {
        setState(() => _showCheckIcon = true);
      }
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          setState(() => _showCheckIcon = false);
        }
      });
    }
  }

  void _handleInitialBehavior() {

    // if (!(widget.completed == true) &&
    //     _animationController.status != AnimationStatus.completed) {

      widget.onCompleted?.call(false);
      _animationController.value = 1.0;
      _animationController.reverse();
    // } else if (!_showCheckIcon) {
    //   widget.onCompleted?.call(false);
    //   _animationController.value = 1.0;
    // }
  }

  void _handleTapCancel() {
    if (_animationController.status != AnimationStatus.completed) {
      // _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        // onTapDown: _handleInitialBehavior,
        onTapUp: (_) => _handleTapCancel(),
        onTapCancel: _handleTapCancel,
        child: AnimatedBuilder(
          animation: _curveAnimation,
          builder: (BuildContext context, Widget? child) {
            final themeData = AppTheme.of(context);
            final double progress;
            if (widget.completed == null) {
              progress = _curveAnimation.value;
            } else {

              progress = widget.completed! ? 0.0 : _curveAnimation.value;
            }
            // progress = widget.completed ? 1.0 : _curveAnimation.value;
            final hasCompleted = progress == 0.0;
            final iconColor =
                hasCompleted ? themeData.accentNegative : themeData.taskIcon;
           // if (hasCompleted)  {
           //   context.pop();
           // }
            return Hero(
              tag: widget.tag,
              child: Stack(
                children: [
                  TimerCompletionRing(
                    progress: progress,
                  ),
                  Positioned.fill(
                    child: CenteredSvgIcon(
                      iconName: hasCompleted && _showCheckIcon
                          ? AppAssets.check
                          : widget.iconName,
                      color: iconColor,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
}
