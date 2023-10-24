import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newware_final_project/common/app_navigator.dart';
import 'package:newware_final_project/router/router_config.dart';

class ProductListNavigator extends AppNavigator {
  ProductListNavigator({required BuildContext context})
      : super(context: context);

  void openProductDetailPage(int productId) {
    GoRouter.of(context).pushNamed(
      AppRouter.productDetail,
      pathParameters: {
        'productId': '$productId',
      },
    );
  }

  void openSearchPage({Function? searchFunc, String? nameSearch}) {
    GoRouter.of(context).pushNamed(
      AppRouter.search,
      queryParameters: {
        'nameSearch': nameSearch ?? '',
      },
    ).then((result) {
      searchFunc!(result);
    });
  }
}
