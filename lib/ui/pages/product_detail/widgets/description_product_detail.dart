import 'package:flutter/material.dart';
import 'package:newware_final_project/common/app_colors.dart';
import 'package:newware_final_project/common/app_styles.dart';
import 'package:newware_final_project/generated/l10n.dart';

class DescriptionProductDetail extends StatelessWidget {
  final String description;


  const DescriptionProductDetail({super.key,  required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            S.of(context).textDescription,
            textAlign: TextAlign.start,
            style: AppStyles.textStyle(
              fontSize: 20,
              fontFamily: 'ExtraBold',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        AppStyles.sizedBoxStyle(),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
           description,
            style: AppStyles.textStyle(
              fontFamily: 'Regular',
              fontSize: 14,
              color: AppColors.greyColor_1,
            ),
            maxLines: 3,
          ),
        ),
      ],
    );
  }
}
