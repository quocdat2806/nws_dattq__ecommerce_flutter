import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newware_final_project/common/app_navigator.dart';
import 'package:newware_final_project/router/router_config.dart';

class SplashNavigator extends AppNavigator {
  SplashNavigator({required BuildContext context}) : super(context: context);

  void openAuthPage() {
    GoRouter.of(context).pushReplacementNamed(
      AppRouter.auth,
    );
  }

  void openMainPage() {
    GoRouter.of(context).pushReplacementNamed(
      AppRouter.main,
    );
  }

  void openHomePage() {
    GoRouter.of(context).pushReplacementNamed(
      AppRouter.home,
    );
  }

  void openOnboardingPage() {
    GoRouter.of(context).pushReplacementNamed(
      AppRouter.onBoarding,
    );
  }
}
