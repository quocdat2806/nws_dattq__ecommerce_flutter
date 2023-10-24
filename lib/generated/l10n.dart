// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `20% Discount\nNew Arrival Product`
  String get titleOnbroadingPage_1 {
    return Intl.message(
      '20% Discount\nNew Arrival Product',
      name: 'titleOnbroadingPage_1',
      desc: '',
      args: [],
    );
  }

  /// `Take Advantage\n Of The Offer Shopping`
  String get titleOnbroadingPage_2 {
    return Intl.message(
      'Take Advantage\n Of The Offer Shopping',
      name: 'titleOnbroadingPage_2',
      desc: '',
      args: [],
    );
  }

  /// `All Type Of\n Within Your Reach`
  String get titleOnbroadingPage_3 {
    return Intl.message(
      'All Type Of\n Within Your Reach',
      name: 'titleOnbroadingPage_3',
      desc: '',
      args: [],
    );
  }

  /// `Publish up your selfies to make yourself more beautiful with this app`
  String get descOnbroadingPage {
    return Intl.message(
      'Publish up your selfies to make yourself more beautiful with this app',
      name: 'descOnbroadingPage',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get textWelcome {
    return Intl.message(
      'Welcome',
      name: 'textWelcome',
      desc: '',
      args: [],
    );
  }

  /// `Please login or sing up to continue our app`
  String get textLoginNote {
    return Intl.message(
      'Please login or sing up to continue our app',
      name: 'textLoginNote',
      desc: '',
      args: [],
    );
  }

  /// `Sing Up`
  String get textSingUp {
    return Intl.message(
      'Sing Up',
      name: 'textSingUp',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get textLogin {
    return Intl.message(
      'Login',
      name: 'textLogin',
      desc: '',
      args: [],
    );
  }

  /// `Create an new account`
  String get textCreateAccount {
    return Intl.message(
      'Create an new account',
      name: 'textCreateAccount',
      desc: '',
      args: [],
    );
  }

  /// `By create an account you have to agree with our them & condication`
  String get textProxy {
    return Intl.message(
      'By create an account you have to agree with our them & condication',
      name: 'textProxy',
      desc: '',
      args: [],
    );
  }

  /// `Successfully`
  String get textSuccessFully {
    return Intl.message(
      'Successfully',
      name: 'textSuccessFully',
      desc: '',
      args: [],
    );
  }

  /// `You have successfully registered in our app and start working in it`
  String get textSuccessFullyDesc {
    return Intl.message(
      'You have successfully registered in our app and start working in it',
      name: 'textSuccessFullyDesc',
      desc: '',
      args: [],
    );
  }

  /// `Login with Google`
  String get textLoginWithGoogle {
    return Intl.message(
      'Login with Google',
      name: 'textLoginWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Login with Facebook`
  String get textLoginWithFacebook {
    return Intl.message(
      'Login with Facebook',
      name: 'textLoginWithFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Login with Apple`
  String get textLoginWithApple {
    return Intl.message(
      'Login with Apple',
      name: 'textLoginWithApple',
      desc: '',
      args: [],
    );
  }

  /// `Account or password is incorrect`
  String get textInvalid {
    return Intl.message(
      'Account or password is incorrect',
      name: 'textInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Start Shopping`
  String get textStartShopping {
    return Intl.message(
      'Start Shopping',
      name: 'textStartShopping',
      desc: '',
      args: [],
    );
  }

  /// `Your email`
  String get textHintEmailLable {
    return Intl.message(
      'Your email',
      name: 'textHintEmailLable',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get textEmailLable {
    return Intl.message(
      'Email',
      name: 'textEmailLable',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get textPasswordLable {
    return Intl.message(
      'Password',
      name: 'textPasswordLable',
      desc: '',
      args: [],
    );
  }

  /// `Your password`
  String get textHintPasswordLable {
    return Intl.message(
      'Your password',
      name: 'textHintPasswordLable',
      desc: '',
      args: [],
    );
  }

  /// `Please enter this field`
  String get textValidateEmptyString {
    return Intl.message(
      'Please enter this field',
      name: 'textValidateEmptyString',
      desc: '',
      args: [],
    );
  }

  /// `Password inValidate`
  String get textErrorPasswordLable {
    return Intl.message(
      'Password inValidate',
      name: 'textErrorPasswordLable',
      desc: '',
      args: [],
    );
  }

  /// `Email inValidate`
  String get textErrorEmailLable {
    return Intl.message(
      'Email inValidate',
      name: 'textErrorEmailLable',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password inValidate`
  String get textErrorConfirmPasswordLable {
    return Intl.message(
      'Confirm Password inValidate',
      name: 'textErrorConfirmPasswordLable',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password not equal password`
  String get textErrorNotEqualConfirmPasswordLable {
    return Intl.message(
      'Confirm Password not equal password',
      name: 'textErrorNotEqualConfirmPasswordLable',
      desc: '',
      args: [],
    );
  }

  /// `Name must least 4 characters`
  String get textErrorNameLable {
    return Intl.message(
      'Name must least 4 characters',
      name: 'textErrorNameLable',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get textNameLabel {
    return Intl.message(
      'Name',
      name: 'textNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Your name`
  String get textHintNameLabel {
    return Intl.message(
      'Your name',
      name: 'textHintNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get textConfirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'textConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Your confirm password`
  String get textHintConfirmPassword {
    return Intl.message(
      'Your confirm password',
      name: 'textHintConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `min ago`
  String get textMinAgo {
    return Intl.message(
      'min ago',
      name: 'textMinAgo',
      desc: '',
      args: [],
    );
  }

  /// `hour ago`
  String get textHourAgo {
    return Intl.message(
      'hour ago',
      name: 'textHourAgo',
      desc: '',
      args: [],
    );
  }

  /// `day ago`
  String get textDayAgo {
    return Intl.message(
      'day ago',
      name: 'textDayAgo',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get textHome {
    return Intl.message(
      'Home',
      name: 'textHome',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get textCart {
    return Intl.message(
      'Cart',
      name: 'textCart',
      desc: '',
      args: [],
    );
  }

  /// `Notify`
  String get textNotify {
    return Intl.message(
      'Notify',
      name: 'textNotify',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get textProfile {
    return Intl.message(
      'Profile',
      name: 'textProfile',
      desc: '',
      args: [],
    );
  }

  /// `Search Category`
  String get textSearch {
    return Intl.message(
      'Search Category',
      name: 'textSearch',
      desc: '',
      args: [],
    );
  }

  /// `product`
  String get textProduct {
    return Intl.message(
      'product',
      name: 'textProduct',
      desc: '',
      args: [],
    );
  }

  /// `You have placed your order successfully`
  String get textAddToCartSuccess {
    return Intl.message(
      'You have placed your order successfully',
      name: 'textAddToCartSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Your order has failed`
  String get textAddToCartFail {
    return Intl.message(
      'Your order has failed',
      name: 'textAddToCartFail',
      desc: '',
      args: [],
    );
  }

  /// `Review`
  String get textReview {
    return Intl.message(
      'Review',
      name: 'textReview',
      desc: '',
      args: [],
    );
  }

  /// `Available in stock`
  String get textCouterInStock {
    return Intl.message(
      'Available in stock',
      name: 'textCouterInStock',
      desc: '',
      args: [],
    );
  }

  /// `Size`
  String get textSize {
    return Intl.message(
      'Size',
      name: 'textSize',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get textDescription {
    return Intl.message(
      'Description',
      name: 'textDescription',
      desc: '',
      args: [],
    );
  }

  /// `Total Price`
  String get textTotalPrice {
    return Intl.message(
      'Total Price',
      name: 'textTotalPrice',
      desc: '',
      args: [],
    );
  }

  /// `Add To Cart`
  String get textAddToCart {
    return Intl.message(
      'Add To Cart',
      name: 'textAddToCart',
      desc: '',
      args: [],
    );
  }

  /// `My Cart`
  String get textMyCart {
    return Intl.message(
      'My Cart',
      name: 'textMyCart',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get textTotal {
    return Intl.message(
      'Total',
      name: 'textTotal',
      desc: '',
      args: [],
    );
  }

  /// `item`
  String get textItem {
    return Intl.message(
      'item',
      name: 'textItem',
      desc: '',
      args: [],
    );
  }

  /// `Process To Checkout`
  String get textCheckoutCart {
    return Intl.message(
      'Process To Checkout',
      name: 'textCheckoutCart',
      desc: '',
      args: [],
    );
  }

  /// `Your Cart is empty! Please Add To Cart`
  String get textCartEmpty {
    return Intl.message(
      'Your Cart is empty! Please Add To Cart',
      name: 'textCartEmpty',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
