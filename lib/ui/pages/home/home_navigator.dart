import 'package:flutter/material.dart';
import 'package:newware_final_project/common/app_navigator.dart';
import 'package:newware_final_project/router/router_config.dart';

class HomeNavigator extends AppNavigator {
  HomeNavigator({required BuildContext context}) : super(context: context);

  void openProductListPage({categoryName, categoryId,children}) {
    AppRouter.router.pushNamed(AppRouter.productList, pathParameters: {
      'categoryId': '$categoryId',
      'categoryName': categoryName,
    },);
  }
}
