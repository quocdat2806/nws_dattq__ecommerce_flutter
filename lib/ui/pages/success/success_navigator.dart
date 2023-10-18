import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newware_final_project/common/app_navigator.dart';
import 'package:newware_final_project/router/router_config.dart';

class SuccessNavigator extends AppNavigator {
  SuccessNavigator({required BuildContext context}) : super(context: context);

  void openMainPage() {
    GoRouter.of(context).pushReplacementNamed(AppRouter.main);
  }
}
