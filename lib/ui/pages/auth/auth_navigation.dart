import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newware_final_project/common/app_navigator.dart';
import 'package:newware_final_project/router/router_config.dart';

class AuthNavigator extends AppNavigator {
  AuthNavigator({required BuildContext context}) : super(context: context);

  void openSignInPage() {
    GoRouter.of(context).pushNamed(AppRouter.signIn);
  }
  void openSignUpPage() {
    GoRouter.of(context).pushNamed(AppRouter.signUp);
  }
}
