// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:newware_final_project/common/app_colors.dart';
import 'package:newware_final_project/common/app_images_icons.dart';
import 'package:newware_final_project/common/app_styles.dart';
import 'package:newware_final_project/ui/widget/header_action/header_action.dart';

class SlideImageProduct extends StatelessWidget {
  final List<String>?images;
  final Function(int value)?onChangeImage;
  final Function ()?onTabBackIcon;
  final Function ()?onTabCartIcon;
  final int ?currentImage;

  SlideImageProduct({
    super.key,
    this.images,
    this.onChangeImage,
    this.onTabBackIcon,
    this.onTabCartIcon,
    this.currentImage
  });

  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: images?.length,
            itemBuilder: (context, index) => Container(
              decoration: AppStyles.boxDecorationNetworkImageStyle(
                pathNetworkImage: images?[index],
              ),
            ),
            onPageChanged: (value) {
              onChangeImage!(value);
            },
          ),
          Positioned(
            left: 20,
            right: 20,
            top: 40,
            child: HeaderAction(
              onTabLeftIcon:onTabBackIcon,
              onTabRightIcon: onTabCartIcon,
              pathIconLeft: AppImages.pathBackImage,
              iconRight: Stack(
                children: [
                  Container(
                    constraints: const BoxConstraints(
                      minWidth: 44,
                      minHeight: 44,
                    ),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryColor,
                    ),
                    child: AppStyles.iconSvgStyle(
                      pathImage: AppImages.pathShoppingImage,
                      width: 30.0,
                      height: 30.0,
                    ),
                  ),

                ],
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            right: 20,
            child: Container(
              constraints: const BoxConstraints(
                minWidth: 44,
                minHeight: 44,
              ),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryColor,
              ),
              child: AppStyles.iconSvgStyle(
                pathImage: AppImages.pathHeartBlackImage,
                width: 30.0,
                height: 30.0,
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 50,
            right: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                ...List.generate(
                  images!.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      padding: currentImage == index
                          ? const EdgeInsets.all(3)
                          : EdgeInsets.zero,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: currentImage == index
                            ? Border.all(
                                width: 1.5,
                                color: AppColors.primaryColor,
                              )
                            : null,
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        width: 10,
                        height: 10,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
