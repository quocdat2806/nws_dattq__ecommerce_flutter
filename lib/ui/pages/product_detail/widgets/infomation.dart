// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:newware_final_project/common/app_colors.dart';
import 'package:newware_final_project/common/app_images_icons.dart';
import 'package:newware_final_project/common/app_styles.dart';
import 'package:newware_final_project/generated/l10n.dart';

class InformationProduct extends StatelessWidget {
  final String? title;
  final String? description;
  final Function()? handleDecreseQuantity;
  final Function()? handleIncreseQuantity;
  final int ?quantity;
  const InformationProduct({
    super.key,
    this.title,
    this.description,
    this.handleDecreseQuantity,
    this.handleIncreseQuantity,
    this.quantity
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title ?? '',
                style: AppStyles.textStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Bold',
                ),
                maxLines: 2,
              ),
              AppStyles.sizedBoxStyle(),
              Text(
               description ?? '',
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
                  ...List.generate(
                    5,
                    (index) => const Image(
                      width: 16,
                      height: 16,
                      image: AssetImage(
                        AppImages.pathStarImage,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    '(320 ${S.of(context).textReview})',
                  ),
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
                color: const Color(0xFFEEEEEE),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: handleDecreseQuantity,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        '-',
                        style: AppStyles.textStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${quantity!}',
                    style: AppStyles.textStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: handleIncreseQuantity,
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
        ),
      ],
    );
  }
}
