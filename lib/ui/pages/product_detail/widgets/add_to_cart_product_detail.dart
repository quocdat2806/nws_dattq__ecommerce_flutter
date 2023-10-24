// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newware_final_project/bloc/app_cubit.dart';
import 'package:newware_final_project/common/app_colors.dart';
import 'package:newware_final_project/common/app_images_icons.dart';
import 'package:newware_final_project/common/app_styles.dart';
import 'package:newware_final_project/generated/l10n.dart';
import 'package:newware_final_project/models/enums/load_status.dart';

class AddToCartProductDetail extends StatelessWidget {
  final state;
  final cubit;

  const AddToCartProductDetail({
    super.key,
    required this.state,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              '\$${cubit.handleTotalPrice(
                price: state.productEntity?.price ?? 0,
              )}.00 ',
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
            color: state.loadAddtoCartStatus != LoadStatus.successAddToCart
                ? AppColors.secondaryColor
                : AppColors.greyColor,
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
                    onTap: () {
                      if (state.loadAddtoCartStatus == LoadStatus.success) {
                        return;
                      }
                      cubit.handleAddToCart(
                        userEntity: stateUser.user,
                        productEntity: state.productEntity,
                      );
                    },
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
              )
            ],
          ),
        )
      ],
    );
  }
}
