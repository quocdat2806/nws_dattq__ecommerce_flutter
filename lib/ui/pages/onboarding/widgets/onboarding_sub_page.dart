import 'package:flutter/material.dart';
import 'package:newware_final_project/common/app_colors.dart';
import 'package:newware_final_project/common/app_styles.dart';
import 'package:newware_final_project/common/app_texts.dart';

class OnboardingSubPage extends StatelessWidget {
  final String title;
  final String image;
  final String description;

  const OnboardingSubPage({
    super.key,
    required this.title,
    required this.image,
    this.description = AppTexts.descriptionOnbroadingPage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              transform: Matrix4.skewY(-0.07),
              height: MediaQuery.of(context).size.height / 2 + 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(30),
                  left: Radius.circular(30),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(image),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: AppStyles.textStyle(
                fontSize: 30,
                fontFamily: 'ExtraBold',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              description,
              style: AppStyles.textStyle(
                fontSize: 16,
                color: AppColors.greyColor_1,
                fontFamily: 'Regular',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
