import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newware_final_project/common/app_navigator.dart';
import 'package:newware_final_project/router/router_config.dart';

class ProductDetailNavigator extends AppNavigator {
  ProductDetailNavigator({
    required BuildContext context,
  }) : super(context: context);

  void openCartPage() {
    GoRouter.of(context).pushReplacementNamed(
      AppRouter.main,
    );
  }

  void backPage() {
    GoRouter.of(context).pop();
  }
}
