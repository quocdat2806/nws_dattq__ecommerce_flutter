import 'package:flutter/material.dart';
import 'package:newware_final_project/common/app_images_icons.dart';


class Fashion extends StatelessWidget {
  const Fashion({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Align(
      alignment: Alignment.center,
      child: Image(
        image: AssetImage(
          AppImages.pathFashionImage,
        ),
      ),
    );
  }
}
