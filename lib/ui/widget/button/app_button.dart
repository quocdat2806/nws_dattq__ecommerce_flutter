import 'package:flutter/material.dart';
import 'package:newware_final_project/common/app_colors.dart';
import 'package:newware_final_project/common/app_styles.dart';

class AppButton extends StatelessWidget {
  final String textButton;
  final Color? backGroundColor;
  final Widget? icon;
  final Color textColor;
  final bool isHasBorder;
  final Function()? onTabButton;

  const AppButton({
    super.key,
    this.textButton = '',
    this.backGroundColor = Colors.white,
    this.icon,
    this.textColor = Colors.white,
    this.isHasBorder = false,
    this.onTabButton,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTabButton,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: backGroundColor,
            border: Border.all(
              width: isHasBorder ? 1.5 : 0,
              color: AppColors.greyColor_4,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                icon!,
                const SizedBox(width: 5),
              ],
              Text(
                textButton,
                textAlign: TextAlign.center,
                style: AppStyles.textStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: 'ExtraBold',
                  color: textColor,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
