import 'package:flutter/material.dart';
import 'package:newware_final_project/common/app_colors.dart';
import 'package:newware_final_project/common/app_styles.dart';
import 'package:newware_final_project/common/app_texts.dart';
import 'package:newware_final_project/hooks/debounce.dart';
import 'package:newware_final_project/utils/utils.dart';

class AppNameTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final ValueChanged<String>? onChanged;
  final String? labelText;
  final String? hintText;
  final Widget? icon;

  const AppNameTextField({
    Key? key,
    required this.textEditingController,
    this.onChanged,
    this.icon,
    this.labelText = AppTexts.textNameLabel,
    this.hintText =  AppTexts.textHintNameLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText!,
            style: AppStyles.textStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontFamily: 'Bold',
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: AppColors.greyColor_4,
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    onChanged: (value) {
                      Debouncer().run(() {
                        onChanged!(value);
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppTexts.textValidateEmptyString;
                      }
                      if (!Utils.isPassword(value)) {
                        return AppTexts.textErrorNameLable;
                      }
                      return null;
                    },
                    controller: textEditingController,
                    decoration: InputDecoration(
                      hintText: hintText!,
                      hintStyle: AppStyles.textStyle(
                        color: AppColors.greyColor_1,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                icon ?? const SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}