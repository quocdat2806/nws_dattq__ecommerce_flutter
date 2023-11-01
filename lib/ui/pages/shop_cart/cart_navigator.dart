import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newware_final_project/common/app_navigator.dart';

class CartNavigator extends AppNavigator {

  CartNavigator({
    required BuildContext context,
  }) : super(context: context);


  void backPage() {
    GoRouter.of(context).pop();
  }
}
