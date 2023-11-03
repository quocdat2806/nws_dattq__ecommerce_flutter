import 'package:flutter/material.dart';
import 'package:newware_final_project/common/app_colors.dart';
import 'package:newware_final_project/common/app_styles.dart';
import 'package:newware_final_project/generated/l10n.dart';

class CheckBoxProxy extends StatefulWidget {
  final Function()? handleTabCheckbox;

  final bool? isCheckedCheckbox;

  const CheckBoxProxy({
    super.key,
    this.handleTabCheckbox,
    this.isCheckedCheckbox = false,
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
      value: widget.isCheckedCheckbox,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      contentPadding: const EdgeInsets.all(0),
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(
        S.current.textProxy,
        style: AppStyles.textStyle(
          color: AppColors.greyColor_3,
          fontFamily: 'Regular',
        ),
      ),
      onChanged: (value) {
        widget.handleTabCheckbox!();
      },
    );
  }
}
