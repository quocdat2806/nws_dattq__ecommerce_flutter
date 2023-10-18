import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newware_final_project/common/app_colors.dart';
import 'package:newware_final_project/common/app_images_icons.dart';
import 'package:newware_final_project/common/app_styles.dart';
import 'package:newware_final_project/hooks/debounce.dart';

class SearchCategory extends StatefulWidget {
  final Function(String value) search;

  const SearchCategory({super.key, required this.search});

  @override
  State<SearchCategory> createState() => _SearchCategoryState();
}

class _SearchCategoryState extends State<SearchCategory> {
  final searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppImages.pathSearchImage,
            width: 20,
            height: 20,
          ),
          const SizedBox(width: 10,),
          Expanded(
            child: TextFormField(
              controller: searchTextController,
              onChanged: (value) {
                Debouncer(milliseconds: 500).run(() {
                  widget.search(value);
                });
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: AppStyles.textStyle(
                  color: AppColors.greyColor_3,
                  fontFamily: 'Regular',
                  fontSize: 17,
                ),
                hintText: 'Search Category',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
