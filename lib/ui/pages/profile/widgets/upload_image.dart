import 'package:flutter/material.dart';
import 'package:newware_final_project/common/app_images_icons.dart';
import 'package:newware_final_project/common/app_styles.dart';
import 'package:newware_final_project/generated/l10n.dart';

class UploadImage extends StatelessWidget {
  final String? pathImage;

  const UploadImage({super.key, this.pathImage});

  @override
  Widget build(BuildContext context) {
    String defaultAvatar = AppImages.pathDefaultImage;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              onError: (exception, stackTrace) =>const CircularProgressIndicator() ,
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
                  child: AppStyles.iconSvgStyle(
                    pathImage: AppImages.pathEditIcon,
                    width: 16.0,
                    height: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(
          S.of(context).textUploadImage,
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
