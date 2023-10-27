import 'package:flutter/material.dart';
import 'package:newware_final_project/common/app_colors.dart';
import 'package:newware_final_project/common/app_images_icons.dart';
import 'package:newware_final_project/common/app_styles.dart';
import 'package:newware_final_project/models/entities/product/product_entity.dart';

class ProductItem extends StatelessWidget {
 final ProductEntity?productEntity;
 final Function(int id)? onTabItem;
  const ProductItem({
    super.key,
    this.productEntity,
    this.onTabItem

  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        onTabItem!(productEntity?.id??0);
      },
      child: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              decoration: AppStyles.boxDecorationNetworkImageStyle(
                pathNetworkImage: productEntity?.images![0]??'',
                borderRadius: BorderRadius.circular(20),
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: AppColors.secondaryColor,
                    shape: BoxShape.circle,
                  ),
                  margin: const EdgeInsets.all(12),
                  child: AppStyles.iconSvgStyle(
                    pathImage: AppImages.pathHeartImage,
                    height: 40.0,
                    width: 40.0,
                  ),
                ),
              ),
            ),
          ),
          AppStyles.sizedBoxStyle(height: 15),
          Text(
            productEntity?.title??'',
            style: AppStyles.textStyle(
              fontSize: 17,
              fontFamily: 'Bold',
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
          AppStyles.sizedBoxStyle(height: 4),
          Text(
            productEntity?.description??'',
            style: AppStyles.textStyle(
              fontSize: 15,
              fontFamily: 'Regular',
              fontWeight: FontWeight.w300,
              color: AppColors.greyColor_3,
            ),
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
          AppStyles.sizedBoxStyle(height: 4),
          Text(
            '\$ ${productEntity?.price??''} .00',
            style: AppStyles.textStyle(
              fontSize: 18,
              fontFamily: 'ExtraBold',
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
