import 'package:flutter/material.dart';
import 'package:newware_final_project/common/app_colors.dart';
import 'package:newware_final_project/generated/l10n.dart';

class DeviderLine extends StatelessWidget {
  const DeviderLine({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const Expanded(
          child: Divider(
            thickness: 1,
            color: AppColors.greyColor_4,
          ),
        ),
        Text('      ${S.current.textOr}      '),
        const Expanded(
          child: Divider(
            thickness: 1,
            color: AppColors.greyColor_4,
          ),
        ),
      ],
    );
  }
}
