import 'package:flutter/material.dart';
import 'package:newware_final_project/common/app_styles.dart';
import 'package:newware_final_project/generated/l10n.dart';

class CategoryItem extends StatelessWidget {
  final String? pathImage;
  final String? name;
  final int? totalProduct;

  const CategoryItem({
    super.key,
    this.pathImage,
    this.name,
    this.totalProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: AppStyles.boxDecorationNetworkImageStyle(
        pathNetworkImage: pathImage,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white.withOpacity(.75),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
               name!,
                maxLines: 1,
                style: AppStyles.textStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'ExtraBold',
                ),
              ),
              AppStyles.sizedBoxStyle(height: 4),
              Text(
                '$totalProduct ${S.of(context).textProduct}',
                style: AppStyles.textStyle(
                  fontSize: 14,
                  fontFamily: 'Bold',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
