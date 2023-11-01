// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newware_final_project/bloc/app_cubit.dart';
import 'package:newware_final_project/common/app_colors.dart';
import 'package:newware_final_project/common/app_images_icons.dart';
import 'package:newware_final_project/common/app_styles.dart';
import 'package:newware_final_project/generated/l10n.dart';

class AddToCart extends StatelessWidget {
  final int? totalPrice;
  final Function()?handleAddToCart;

  const AddToCart({
    super.key,
    this.totalPrice,
    this.handleAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          children: [
            Text(
              S.of(context).textTotalPrice,
              style: AppStyles.textStyle(
                fontFamily: 'Regular',
                fontSize: 14,
                color: AppColors.greyColor_1,
              ),
            ),
            AppStyles.sizedBoxStyle(height: 4),
            Text(
              '\$ $totalPrice .00 ',
              style: AppStyles.textStyle(
                fontFamily: 'Bold',
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 14,
          ),
          decoration: BoxDecoration(
            color:  AppColors.secondaryColor,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            children: [
              AppStyles.iconSvgStyle(
                pathImage: AppImages.pathCartBlack,
              ),
              const SizedBox(width: 10),
              BlocBuilder<AppCubit, AppState>(
                builder: (context, stateUser) {
                  return InkWell(
                    onTap: handleAddToCart,
                    child: Text(
                      S.of(context).textAddToCart,
                      style: AppStyles.textStyle(
                        color: AppColors.primaryColor,
                        fontFamily: 'Bold',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
