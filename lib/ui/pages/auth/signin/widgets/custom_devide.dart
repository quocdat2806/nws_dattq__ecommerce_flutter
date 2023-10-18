import 'package:flutter/material.dart';
import 'package:newware_final_project/common/app_colors.dart';

class DeviderLine extends StatelessWidget {
  const DeviderLine({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: AppColors.greyColor_4,
          ),
        ),
        Text('      or      '),
        Expanded(
          child: Divider(
            thickness: 1,
            color: AppColors.greyColor_4,
          ),
        ),
      ],
    );
  }
}
