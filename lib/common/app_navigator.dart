import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newware_final_project/router/router_config.dart';

class AppNavigator {
  BuildContext context;

  AppNavigator({required this.context});

  void pop<T extends Object?>([T? result]) {
    GoRouter.of(context).pop(result);
  }
  void push<T extends Object?>([T? result]) {
    GoRouter.of(context).push(result as String);
  }

  void forceSignIn() {
    while (GoRouter.of(context).canPop()) {
      GoRouter.of(context).pop();
    }
    GoRouter.of(context).pushReplacementNamed(AppRouter.signIn);
    GoRouter.of(context).push(AppRouter.signIn);
  }
}
