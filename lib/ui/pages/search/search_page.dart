import 'package:flutter/material.dart';
import 'package:newware_final_project/common/app_colors.dart';
import 'package:newware_final_project/common/app_images_icons.dart';
import 'package:newware_final_project/common/app_styles.dart';

class SearchPage extends StatefulWidget {
  final String? nameSearch;

  const SearchPage({super.key, this.nameSearch});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final searchEdittingController =
        TextEditingController(text: widget.nameSearch ?? '');
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
          AppStyles.iconSvgStyle(
            pathImage: AppImages.pathQuestionImage,
          ),
          const SizedBox(width: 20),
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
                      child: AppStyles.iconSvgStyle(
                        pathImage: AppImages.pathSearchImage,
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
