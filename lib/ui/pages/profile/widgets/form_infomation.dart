import 'package:flutter/material.dart';
import 'package:newware_final_project/common/app_colors.dart';
import 'package:newware_final_project/common/app_styles.dart';

class Information extends StatelessWidget {
  final String? labelText;
  final String? textHint;

  const Information({super.key, this.labelText, this.textHint});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            constraints: const BoxConstraints(
              minWidth: 70,
            ),
            child: Text(
              labelText ?? '',
              style: AppStyles.textStyle(
                color: AppColors.greyColor_1,
                fontSize: 17,
              ),
            ),
          ),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                enabled: false,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 2,
                ),
                hintText: textHint ?? '',
                hintStyle: AppStyles.textStyle(
                  color: AppColors.secondaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Regular',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
