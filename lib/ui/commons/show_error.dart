import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class ErrorAlert{
  void showError(BuildContext context) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      text: 'Đơn hàng đã tồn tại trong giỏ hàng',
    );
  }
}