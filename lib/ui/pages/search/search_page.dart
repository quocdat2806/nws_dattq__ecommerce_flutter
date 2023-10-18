import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newware_final_project/common/app_colors.dart';
import 'package:newware_final_project/common/app_images_icons.dart';
import 'package:newware_final_project/common/app_styles.dart';

class SearchPage extends StatelessWidget {
  final String? nameSearch;

  const SearchPage({super.key, this.nameSearch});

  @override
  Widget build(BuildContext context) {
    final searchEdittingController =
        TextEditingController(text: nameSearch ?? '');
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFe35c49),
        title: Text(
          'Search',
          style: AppStyles.textStyle(
            fontSize: 18,
            color: AppColors.secondaryColor,
          ),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(
              context,
              searchEdittingController.text,
            );
          },
          child: const Icon(
            Icons.navigate_before_outlined,
            size: 30,
            color: AppColors.greyColor,
          ),
        ),
        actions: [
          SvgPicture.asset(
            AppImages.pathQuestionImage,
            width: 20,
            height: 20,
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xFFe35c49),
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: searchEdittingController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: AppStyles.textStyle(
                            color: AppColors.greyColor_3,
                            fontFamily: 'Regular',
                            fontSize: 17,
                          ),
                          hintText: 'Search Product',
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(
                          context,
                          searchEdittingController.text,
                        );
                      },
                      child: SvgPicture.asset(
                        AppImages.pathSearchImage,
                        width: 20,
                        height: 20,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      ' Search History',
                      style: AppStyles.textStyle(
                        fontSize: 18,
                        fontFamily: 'Bold',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const Text('Clear all')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
