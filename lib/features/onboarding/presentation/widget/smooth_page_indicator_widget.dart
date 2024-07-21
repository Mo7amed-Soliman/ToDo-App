import 'package:flutter/material.dart';
import 'package:todo_app/core/helper/utils/app_colors.dart';

class SmoothPageIndicatorWidget extends StatelessWidget {
  const SmoothPageIndicatorWidget({
    super.key,
    required this.length,
    required this.currentPage,
  });

  final int length;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.only(right: 5),
          height: 3,
          width: currentPage == index ? 40 : 20,
          decoration: BoxDecoration(
            color: currentPage == index
                ? AppColors.primaryColor
                : const Color(0xFFD8D8D8),
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ),
    );
  }
}
