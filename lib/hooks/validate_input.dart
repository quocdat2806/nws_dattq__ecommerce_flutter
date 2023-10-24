import 'package:flutter/material.dart';
import 'package:newware_final_project/common/app_images_icons.dart';
import 'package:newware_final_project/common/app_styles.dart';
import 'package:newware_final_project/models/enums/load_status.dart';

class ValidateInput {
  Map<String, Widget> checkValidateSingUp({
    state,
  }) {
    Map<String, Widget> icons = {
      'emailIcon': const SizedBox.shrink(),
      'passwordIcon': const SizedBox.shrink(),
      'nameIcon': const SizedBox.shrink(),
      'confirmPasswordIcon': const SizedBox.shrink(),
    };

    if (state.emailStatus == StatusInput.inValidEmail) {
      icons['emailIcon'] = AppStyles.iconSvgStyle(
        pathImage: AppImages.pathCloseImage,
      );
    }
    if (state.nameStatus == StatusInput.inValidName) {
      icons['nameIcon'] = AppStyles.iconSvgStyle(
        pathImage: AppImages.pathCloseImage,
      );
    }
    if (state.confirmPasswordStatus ==
        StatusInput.inValidConfirmPassword) {
      icons['confirmPasswordIcon'] = AppStyles.iconSvgStyle(
        pathImage: AppImages.pathCloseImage,
      );
    }
    if (state.passwordStatus == StatusInput.inValidPassword) {
      icons['passwordIcon'] = AppStyles.iconSvgStyle(
        pathImage: AppImages.pathCloseImage,
      );
    }
    if (state.nameStatus == StatusInput.validName) {
      icons['nameIcon'] = AppStyles.iconSvgStyle(
        pathImage: AppImages.pathCheckImage,
      );
    }
    if (state.confirmPasswordStatus ==
        StatusInput.validConfirmPassword) {
      icons['confirmPasswordIcon'] = AppStyles.iconSvgStyle(
        pathImage: AppImages.pathCheckImage,
      );
    }
    if (state.emailStatus == StatusInput.validEmail) {
      icons['emailIcon'] = AppStyles.iconSvgStyle(
        pathImage: AppImages.pathCheckImage,
      );
    }
    if (state.passwordStatus == StatusInput.validPassword) {
      icons['passwordIcon'] = AppStyles.iconSvgStyle(
        pathImage: AppImages.pathCheckImage,
      );
    }

    return icons;
  }
  Map<String, Widget> checkValidateLogin({
    state,
  }) {
    Map<String, Widget> icons = {
      'emailIcon': const SizedBox.shrink(),
      'passwordIcon': const SizedBox.shrink(),
    };

    if (state.emailStatus == StatusInput.inValidEmail) {
      icons['emailIcon'] = AppStyles.iconSvgStyle(
        pathImage: AppImages.pathCloseImage,
      );
    }


    if (state.passwordStatus == StatusInput.inValidPassword) {
      icons['passwordIcon'] = AppStyles.iconSvgStyle(
        pathImage: AppImages.pathCloseImage,
      );
    }


    if (state.emailStatus == StatusInput.validEmail) {
      icons['emailIcon'] = AppStyles.iconSvgStyle(
        pathImage: AppImages.pathCheckImage,
      );
    }
    if (state.passwordStatus == StatusInput.validPassword) {
      icons['passwordIcon'] = AppStyles.iconSvgStyle(
        pathImage: AppImages.pathCheckImage,
      );
    }

    return icons;
  }
}





