import 'package:flutter/material.dart';
import 'package:newware_final_project/generated/l10n.dart';
import 'package:quickalert/quickalert.dart';

class ConfirmAlert{
  void showLogoutAlert(BuildContext context, Function() handleLogout) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.confirm,
      text: S.current.textYouWantToLogOut,
      confirmBtnText: S.current.textYes,
      cancelBtnText: S.current.textNo,
      onConfirmBtnTap: handleLogout,
      confirmBtnColor: Colors.green,

    );
  }
}