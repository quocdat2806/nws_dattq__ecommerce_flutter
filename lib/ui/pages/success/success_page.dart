import 'package:flutter/material.dart';
import 'package:newware_final_project/common/app_colors.dart';
import 'package:newware_final_project/common/app_images_icons.dart';
import 'package:newware_final_project/common/app_styles.dart';
import 'package:newware_final_project/generated/l10n.dart';
import 'package:newware_final_project/ui/pages/success/success_navigator.dart';
import 'package:newware_final_project/ui/widget/button/app_button.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    final SuccessNavigator successNavigator =
        SuccessNavigator(context: context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppStyles.sizedBoxStyle(height: 70),
              const Image(
                width: 75,
                height: 75,
                image: AssetImage(
                  AppImages.pathCheckSuccessImage,
                ),
              ),
              Text(
                S.of(context).textSuccessFully,
                style: AppStyles.textStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  fontFamily: 'ExtraBold',
                ),
              ),
              AppStyles.sizedBoxStyle(),
              Text(
                S.of(context).textSuccessFullyDesc,
                style: AppStyles.textStyle(
                  fontSize: 16,
                  color: AppColors.greyColor_1,
                ),
                textAlign: TextAlign.center,
              ),
              AppStyles.sizedBoxStyle(height: 250),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: InkWell(
                  onTap: () {
                    successNavigator.openMainPage();
                  },
                  child: AppButton(
                    textButton: S.of(context).textStartShopping,
                    textColor: AppColors.primaryColor,
                    backGroundColor: AppColors.secondaryColor,
                    icon: null,
                    isHasBorder: false,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
