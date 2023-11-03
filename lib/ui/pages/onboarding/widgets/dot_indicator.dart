import 'package:flutter/material.dart';
import 'package:newware_final_project/common/app_colors.dart';

class DotIndicator extends StatelessWidget {
  final bool isActivePage;

  const DotIndicator(this.isActivePage, {super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 400,
      ),
      height: 6,
      width: isActivePage ? 24 : 6,
      decoration: BoxDecoration(
        color: isActivePage ? AppColors.secondaryColor : AppColors.greyColor,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
