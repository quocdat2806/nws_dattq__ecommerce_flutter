import 'package:flutter/material.dart';
import 'package:newware_final_project/common/app_colors.dart';
import 'package:newware_final_project/common/app_styles.dart';

class SubHeaderAuth extends StatelessWidget {
  final String title;
  final String description;

  const SubHeaderAuth({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: AppStyles.textStyle(
              fontWeight: FontWeight.w700,
              fontSize: 22,
              fontFamily: 'Bold',
            ),
          ),
        ),
        AppStyles.sizedBoxStyle(),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            description,
            style: AppStyles.textStyle(
              fontWeight: FontWeight.w500,
              color: AppColors.greyColor_1,
              fontSize: 16,
              fontFamily: 'Regular',
            ),
          ),
        ),
      ],
    );
  }
}
