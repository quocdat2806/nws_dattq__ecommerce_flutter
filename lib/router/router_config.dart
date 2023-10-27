import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newware_final_project/ui/pages/auth/auth_page.dart';
import 'package:newware_final_project/ui/pages/auth/signin/singin_page.dart';
import 'package:newware_final_project/ui/pages/auth/signup/singup_page.dart';
import 'package:newware_final_project/ui/pages/cart/cart_page.dart';
import 'package:newware_final_project/ui/pages/home/home_page.dart';
import 'package:newware_final_project/ui/pages/language/language_page.dart';
import 'package:newware_final_project/ui/pages/main/main_page.dart';
import 'package:newware_final_project/ui/pages/notification/notification_page.dart';
import 'package:newware_final_project/ui/pages/onboarding/onboarding_page.dart';
import 'package:newware_final_project/ui/pages/product_detail/product_detail_page.dart';
import 'package:newware_final_project/ui/pages/product_list/product_list_page.dart';
import 'package:newware_final_project/ui/pages/profile/profile_page.dart';
import 'package:newware_final_project/ui/pages/search/search_page.dart';
import 'package:newware_final_project/ui/pages/splash/splash_page.dart';
import 'package:newware_final_project/ui/pages/success/success_page.dart';
class AppRouter {
  AppRouter._();

  static final rootKey = GlobalKey<NavigatorState>();
  static final shellKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: rootKey,
    initialLocation: '/',
    debugLogDiagnostics: false,
    routes: _routes,
  );

  ///main page
  static const String splash = "/";
  static const String main = "main";
  static const String home = "home";
  static const String auth = "auth";
  static const String signIn = "signIn";
  static const String singUp = "singUp";
  static const String onBoarding = 'onBoarding';
  static const String profile = 'profile';
  static const String productList = 'productList';
  static const String productDetail = 'productDetail';
  static const String search = 'search';
  static const String notify = 'notify';
  static const String cart = 'cart';
  static const String success = 'success';
  static const String language = "language";

  static final _routes = <RouteBase>[
    GoRoute(
      path: splash,
      builder: (context, state) => const SplashPage(),
    ),

    GoRoute(
      name: home,
      path: "/$home",
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      name: language,
      path: "/$language",
      builder: (context, state) => const LanguagePage(),
    ),
    GoRoute(
      name: main,
      path: "/$main",
      builder: (context, state) => const MainPage(),
    ),
    GoRoute(
      name: cart,
      path: "/$cart",
      builder: (context, state) => const CartPage(),
    ),
    GoRoute(
      name: notify,
      path: "/$notify",
      builder: (context, state) => const NotificationPage(),
    ),
    GoRoute(
      name: profile,
      path: "/$profile",
      builder: (context, state) => const ProfilePage(),
    ),
    GoRoute(
      name: productList,
      path: "/$productList/:categoryId/:categoryName",
      builder: (context, state) {
        final categoryId = state.pathParameters['categoryId'];
        final categoryName = state.pathParameters['categoryName'];
        return ProductListPage(
          categoryId: int.parse(categoryId ?? '0'),
          categoryName: categoryName,
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: rootKey,
      name: onBoarding,
      path: "/$onBoarding",
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      parentNavigatorKey: rootKey,
      name: auth,
      path: "/$auth",
      builder: (context, state) => const AuthPage(),
    ),
    GoRoute(
      parentNavigatorKey: rootKey,
      name: signIn,
      path: "/$signIn",
      builder: (context, state) => const SingInPage(),
    ),
    GoRoute(
      parentNavigatorKey: rootKey,
      name: singUp,
      path: "/$singUp",
      builder: (context, state) => const SingUpPage(),
    ),
    GoRoute(
      parentNavigatorKey: rootKey,
      name: success,
      path: "/$success",
      builder: (context, state) => const SuccessPage(),
    ),
    GoRoute(
      parentNavigatorKey: rootKey,
      name: search,
      path: "/$search",
      builder: (context, state) {
        final nameSearch = state.queryParameters['nameSearch'];
        return SearchPage(
          nameSearch: nameSearch,
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: rootKey,
      name: productDetail,
      path: "/$productDetail/:productId",
      builder: (context, state) {
        final productId = state.pathParameters['productId'];
        return ProductDetailPage(
          productId: int.parse(productId!),
        );
      },
    ),
  ];
}
