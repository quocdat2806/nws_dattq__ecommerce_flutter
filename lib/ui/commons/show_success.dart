import 'package:flutter/material.dart';
import 'package:newware_final_project/generated/l10n.dart';
import 'package:quickalert/quickalert.dart';

class SuccessAlert{
  void showSuccessAlert(BuildContext context,String title) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      confirmBtnColor: Colors.black,
      text: title,
      confirmBtnText: S.current.textOkay,
      title: S.current.textSuccess,
    );
  }

}

