import 'package:flutter/material.dart';
import 'package:newware_final_project/common/app_colors.dart';
import 'package:newware_final_project/common/app_styles.dart';
import 'package:newware_final_project/generated/l10n.dart';

class AppNameTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final ValueChanged<String>? onChangedText;
  final String? labelText;
  final String? hintText;
  final Widget? iconValidate;

  const AppNameTextField({
    Key? key,
    required this.textEditingController,
    this.onChangedText,
    this.iconValidate,
    this.labelText,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText??'',
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
                      onChangedText!=null? onChangedText!(value):null;

                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.current.textValidateEmptyString;
                      }
                      if (value.length < 4) {
                        return S.current.textErrorName;
                      }
                      return null;
                    },
                    controller: textEditingController,
                    decoration: InputDecoration(
                      hintText: hintText??'',
                      hintStyle: AppStyles.textStyle(
                        color: AppColors.greyColor_1,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                iconValidate ?? const SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
