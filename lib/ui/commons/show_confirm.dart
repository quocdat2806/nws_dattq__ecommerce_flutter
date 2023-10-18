import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class ConfirmAlert{
  void showLogoutAlert(BuildContext context, Function() logout) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.confirm,
      text: 'Do you want to logout',
      confirmBtnText: 'Yes',
      cancelBtnText: 'No',
      onConfirmBtnTap: logout,
      confirmBtnColor: Colors.green,
    );
  }
}