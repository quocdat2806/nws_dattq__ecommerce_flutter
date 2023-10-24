import 'package:flutter/material.dart';
import 'package:newware_final_project/common/app_colors.dart';
import 'package:newware_final_project/common/app_images_icons.dart';
import 'package:newware_final_project/common/app_styles.dart';
import 'package:newware_final_project/generated/l10n.dart';
import 'package:newware_final_project/ui/pages/auth/auth_navigation.dart';
import 'package:newware_final_project/ui/widget/button/app_button.dart';

class AuthPage extends StatelessWidget {
  static const router = 'auth';

  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authNavigator = AuthNavigator(context: context);
    return Scaffold(
      body: Container(
        decoration: AppStyles.boxDecorationAssetImageStyle(
          pathAssetImage: AppImages.pathAuthPageImage,
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  authNavigator.openSingInPage();
                },
                child:  AppButton(
                  textButton:  S.of(context).textLogin,
                  backGroundColor: AppColors.primaryColor,
                  textColor: AppColors.secondaryColor,
                  icon: null,
                  isHasBorder: false,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  authNavigator.openSingUpPage();
                },
                child:  AppButton(
                  textButton: S.of(context).textSingUp,
                  backGroundColor: Colors.transparent,
                  textColor: AppColors.primaryColor,
                  icon: null,
                  isHasBorder: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
