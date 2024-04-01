import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sisyphus_timer/presentation/theming/app_theme.dart';

import '../../constants/app_assets.dart';
import '../../constants/app_colors.dart';

class EditTimerButton extends StatelessWidget {
  const EditTimerButton({super.key, this.onPressed});
  final VoidCallback? onPressed;

  static const scaleFactor = 0.33;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.of(context).accent,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.black20,
            spreadRadius: 1.5,
            blurRadius: 2,
          ),
        ],
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(
          AppAssets.threeDots,
          colorFilter: ColorFilter.mode(
            AppTheme.of(context).accentNegative,
            BlendMode.srcIn,
          ),
          width: 16,
          height: 16,
        ),
      ),
    );
  }
}
