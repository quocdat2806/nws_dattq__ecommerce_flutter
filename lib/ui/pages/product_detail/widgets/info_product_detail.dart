// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:newware_final_project/common/app_colors.dart';
import 'package:newware_final_project/common/app_images_icons.dart';
import 'package:newware_final_project/common/app_styles.dart';
import 'package:newware_final_project/generated/l10n.dart';

class InfoProductDetail extends StatelessWidget {
  final state;
  final cubit;


  const InfoProductDetail({super.key,  required this.state, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                state.productEntity?.title ?? '',
                style: AppStyles.textStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Bold',
                ),
                maxLines: 2,
              ),
              AppStyles.sizedBoxStyle(),
              Text(
                state.productEntity?.title ?? '',
                style: AppStyles.textStyle(
                  fontSize: 15,
                  color: AppColors.greyColor_1,
                  fontFamily: 'Regular',
                ),
                maxLines: 1,
              ),
              AppStyles.sizedBoxStyle(),
               Row(
                children: [
                  ...List.generate(5, (index) =>
                  const Image(
                    width: 16,
                    height: 16,
                    image: AssetImage(
                      AppImages.pathStarImage,
                    ),
                  ),
                  ),
                  const SizedBox(width: 6,),
                   Text('(320 ${S.of(context).textReview})'),
                ],
              ),
            ],
          ),
        ),
        Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color:const Color(0xFFEEEEEE),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  InkWell(
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        '-',
                        style: AppStyles.textStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    onTap: () {
                      cubit.handleDecresementCouting(
                        price: state.productEntity!.price,
                      );
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${state.quantity!}',
                    style: AppStyles.textStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      cubit.handleIncresementCouting(
                        price: state.productEntity!.price,
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        '+',
                        style: AppStyles.textStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AppStyles.sizedBoxStyle(),
            Text(
              S.of(context).textCouterInStock,
              style: AppStyles.textStyle(
                fontWeight: FontWeight.w500,
                fontFamily: 'Bold',
              ),
            ),
          ],
        )
      ],
    );
  }
}
