import 'package:flutter/material.dart';
import 'package:newware_final_project/generated/l10n.dart';
import 'package:quickalert/quickalert.dart';

class ErrorAlert{
  void showError(BuildContext context) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      text: S.of(context).textAddToCartFail,
    );
  }
}