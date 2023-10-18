import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class SuccessAlert{
  void showSuccessAlert(BuildContext context,String title) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      text: title,
    );
  }

}

