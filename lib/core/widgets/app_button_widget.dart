import 'package:flutter/material.dart';
import 'package:todo_app/core/helper/utils/app_colors.dart';

class AppButtonWidget extends StatelessWidget {
  const AppButtonWidget({
    super.key,
    required this.onPressed,
    this.width,
    required this.text,
    this.color,
  });
  final Function() onPressed;
  final double? width;
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: _getButtonStyle(context),
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: AppColors.white),
        ),
      ),
    );
  }

  ButtonStyle? _getButtonStyle(BuildContext context) {
    return color == null
        ? ElevatedButtonTheme.of(context).style
        : ElevatedButtonTheme.of(context)
            .style!
            .copyWith(backgroundColor: WidgetStateProperty.all(color));
  }
}
