import 'package:flutter/material.dart';
import 'package:newware_final_project/common/app_colors.dart';
import 'package:newware_final_project/common/app_images_icons.dart';
import 'package:newware_final_project/common/app_styles.dart';

class NotificationItem extends StatelessWidget {
  final String? pathImageAvatar;
  final String? timeDiff;
  final String? idNotification;

  const NotificationItem({
    super.key,
    this.pathImageAvatar,
    this.timeDiff,
    this.idNotification,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      pathImageAvatar ?? AppImages.pathErrorImage,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Bạn vừa đặt thành công đơn hàng  $idNotification',
                    ),
                    AppStyles.sizedBoxStyle(height: 20),
                    Text(timeDiff!),
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            color: AppColors.greyColor_1,
          ),
        ],
      ),
    );
  }
}
