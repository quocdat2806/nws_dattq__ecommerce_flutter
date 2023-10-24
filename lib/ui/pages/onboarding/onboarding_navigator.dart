import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newware_final_project/common/app_navigator.dart';
import 'package:newware_final_project/router/router_config.dart';

class OnboardingNavigator extends AppNavigator {
  OnboardingNavigator({required BuildContext context})
      : super(context: context);

  void openAuthPage() {
    GoRouter.of(context).pushReplacementNamed(AppRouter.auth);
  }
}
