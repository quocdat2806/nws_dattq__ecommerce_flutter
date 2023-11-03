import 'package:flutter/material.dart';
import 'package:newware_final_project/common/app_colors.dart';
import 'package:newware_final_project/common/app_styles.dart';
import 'package:newware_final_project/generated/l10n.dart';
import 'package:newware_final_project/utils/utils.dart';

class AppConfirmPasswordField extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextEditingController? passwordEdittingController;
  final ValueChanged<String>? onChangedText;
  final String? labelText;
  final String? hintText;
  final Widget? iconValidate;
  final Widget? iconShowOrHideConfirmPassword;
  final bool isHidePassword;
  final Function()? handleShowOrHideConfirmPassword;

  const AppConfirmPasswordField({
    Key? key,
    required this.textEditingController,
    this.onChangedText,
    this.iconValidate,
    this.iconShowOrHideConfirmPassword,
    this.isHidePassword=true,
    this.handleShowOrHideConfirmPassword,
    this.labelText,
    this.hintText,
    this.passwordEdittingController,
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
                      if (value != passwordEdittingController?.text) {
                        return S.current.textErrorNotEqualConfirmPassword;
                      }
                      if (!Utils.isPassword(value)) {
                        return S.current.textErrorConfirmPassword;
                      }
                      return null;
                    },
                    obscureText: isHidePassword ? true : false,
                    enableSuggestions: isHidePassword ? true : false,
                    keyboardType: TextInputType.visiblePassword,
                    controller: textEditingController,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      hintText: hintText??'',
                      hintStyle: AppStyles.textStyle(
                        color: AppColors.greyColor_1,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                InkWell(
                  onTap: handleShowOrHideConfirmPassword,
                  child: iconShowOrHideConfirmPassword ?? const SizedBox.shrink(),
                ),
                const SizedBox(width: 10),
                iconValidate ?? const SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
