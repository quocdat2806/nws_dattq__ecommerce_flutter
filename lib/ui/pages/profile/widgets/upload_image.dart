import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newware_final_project/common/app_images_icons.dart';
import 'package:newware_final_project/common/app_styles.dart';

class UploadImage extends StatelessWidget {
  final String? pathImage;

  const UploadImage({super.key, this.pathImage});

  @override
  Widget build(BuildContext context) {
    String defaultAvatar = 'https://t4.ftcdn.net/jpg/05/49/98/39/360_F'
        '_549983970_bRCkYfk0P6PP5fKbMhZMIb07mCJ6esXL.jpg';
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                pathImage ?? defaultAvatar,
              ),
            ),
          ),
          margin: const EdgeInsets.only(
            top: 10,
            bottom: 20,
          ),
          width: 110,
          height: 110,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                bottom: -10,
                right: -10,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 1),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/pen.svg',
                    width: 16,
                    height: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(
          'Upload Image',
          style: AppStyles.textStyle(
            fontFamily: 'ExtraBold',
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
