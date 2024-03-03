import 'package:flutter/material.dart';
import 'package:sisyphus_timer/presentation/theming/app_theme.dart';

class HomePageBottomOptions extends StatelessWidget {
  const HomePageBottomOptions({super.key, this.onFlip});
  final VoidCallback? onFlip;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(
              Icons.question_mark,
              color: AppTheme.of(context).settingsLabel,
            ),
            onPressed: () {},
          ),
        ],
      );
}
