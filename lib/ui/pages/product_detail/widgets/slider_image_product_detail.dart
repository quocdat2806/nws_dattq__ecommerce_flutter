// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:newware_final_project/common/app_colors.dart';
import 'package:newware_final_project/common/app_images_icons.dart';
import 'package:newware_final_project/common/app_styles.dart';
import 'package:newware_final_project/ui/widget/header_action/header_action.dart';

class SliderImageProductDetail extends StatelessWidget {
  final state;
  final cubit;
  final int lengthCart;

  SliderImageProductDetail({
    super.key,
    required this.cubit,
    required this.state,
    required this.lengthCart,
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
            itemCount: state.productEntity?.images.length,
            itemBuilder: (context, index) => Container(
              decoration: AppStyles.boxDecorationNetworkImageStyle(
                pathNetworkImage: state.productEntity.images[index],
              ),
            ),
            onPageChanged: (value) {
              cubit.handleChangImage(value);
            },
          ),
          Positioned(
            left: 20,
            right: 20,
            top: 20,
            child: HeaderAction(
              onTabLeftIcon: cubit.backPage,
              onTabRightIcon: cubit.openCartPage,
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
                   lengthCart==0?const SizedBox.shrink():
                   Positioned(
                    right: 10,
                    top: 4,
                    child: Text(
                      '$lengthCart',
                      style: const TextStyle(
                        color: Colors.red,
                        fontFamily: 'Bold',
                        fontWeight: FontWeight.w900,
                      ),
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
                  state.productEntity.images.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      padding: state.currentImage == index
                          ? const EdgeInsets.all(3)
                          : EdgeInsets.zero,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: state.currentImage == index
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
          )
        ],
      ),
    );
  }
}
