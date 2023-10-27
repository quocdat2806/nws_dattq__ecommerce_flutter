// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newware_final_project/common/app_images_icons.dart';

class NextButton extends StatelessWidget {
  final state;
  final cubit;
  final PageController pageController;

  const NextButton({
    super.key,
    this.state,
    this.cubit,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        shape: const CircleBorder(),
      ),
      onPressed: () async {
        int nextPage = state.activePage + 1;
        pageController.animateToPage(
          nextPage,
          duration: const Duration(
            milliseconds: 250,
          ),
          curve: Curves.linear,
        );
        cubit.onNextPage(
          nextPage: nextPage,
          context: context,
        );
      },
      child: SvgPicture.asset(
        AppImages.pathNextIcon,
      ),
    );
  }
}
