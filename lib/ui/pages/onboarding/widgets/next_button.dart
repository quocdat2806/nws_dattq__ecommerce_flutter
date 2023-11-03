// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newware_final_project/common/app_images_icons.dart';

class NextButton extends StatelessWidget {
  final Function() handleNextPage;

  const NextButton({
    super.key,
    required this.handleNextPage,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        shape: const CircleBorder(),
      ),
      onPressed: handleNextPage,
      child: SvgPicture.asset(
        AppImages.pathNextIcon,
      ),
    );
  }
}
