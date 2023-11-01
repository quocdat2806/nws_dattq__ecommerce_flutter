import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newware_final_project/common/app_navigator.dart';
import 'package:newware_final_project/router/router_config.dart';

class SignUpNavigator extends AppNavigator {
  SignUpNavigator({required BuildContext context}) : super(context: context);
  void openSuccessPage() {
    GoRouter.of(context).pushReplacementNamed(AppRouter.success);
  }
}