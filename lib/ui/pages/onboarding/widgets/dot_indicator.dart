import 'package:flutter/material.dart';
import 'package:newware_final_project/common/app_colors.dart';

class DotIndicator extends StatelessWidget {
  final bool isActive;

  const DotIndicator(this.isActive, {super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 400,
      ),
      height: 6,
      width: isActive ? 24 : 6,
      decoration: BoxDecoration(
        color: isActive ? AppColors.secondaryColor : AppColors.greyColor,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
