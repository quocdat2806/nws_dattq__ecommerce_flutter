import 'package:flutter/material.dart';
import 'package:newware_final_project/common/app_colors.dart';
import 'package:newware_final_project/common/app_styles.dart';
import 'package:newware_final_project/common/app_texts.dart';

class CheckBoxProxy extends StatefulWidget {
  final Function() ?changStatusCheckbox;

  final bool? isChecked;

  const CheckBoxProxy({
    super.key,
    this.changStatusCheckbox,
    this.isChecked = false,
  });

  @override
  State<CheckBoxProxy> createState() => _CheckBoxProxyState();
}

class _CheckBoxProxyState extends State<CheckBoxProxy> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: widget.isChecked,
      contentPadding: const EdgeInsets.all(0),
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(
        AppTexts.textProxy,
        style: AppStyles.textStyle(
          color: AppColors.greyColor_3,
          fontFamily: 'Regular',
        ),
      ),
      onChanged: (value){
        widget.changStatusCheckbox!();
      },
    );
  }
}