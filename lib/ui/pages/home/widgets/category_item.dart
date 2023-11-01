import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newware_final_project/common/app_styles.dart';
import 'package:newware_final_project/generated/l10n.dart';
import 'package:newware_final_project/models/entities/category/category_entity.dart';
import 'package:newware_final_project/ui/widget/shimmer/app_shimmer.dart';
class CategoryItem extends StatelessWidget {
  final CategoryEntity? categoryEntity;
  final Function()? onTabCategory;
  const CategoryItem({
    super.key,
    this.categoryEntity,
    this.onTabCategory,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTabCategory,
      child: CachedNetworkImage(
        imageUrl: categoryEntity?.image ?? "http://via.placeholder.com/200x150",
        imageBuilder: (context, imageProvider) => Container(
          alignment: Alignment.center,
          decoration: AppStyles.boxDecorationNetworkImageStyle(
            pathNetworkImage: categoryEntity?.image,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white.withOpacity(.75),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    categoryEntity?.name??'',
                    maxLines: 1,
                    style: AppStyles.textStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'ExtraBold',
                    ),
                  ),
                  AppStyles.sizedBoxStyle(height: 4),
                  Text(
                    '${categoryEntity?.totalProduct} ${S.of(context).textProduct}',
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
        ),
        placeholder: (context, url) =>  const AppShimmer(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
