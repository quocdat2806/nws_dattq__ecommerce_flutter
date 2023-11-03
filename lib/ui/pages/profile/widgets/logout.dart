
import 'package:flutter/material.dart';
import 'package:newware_final_project/common/app_colors.dart';
import 'package:newware_final_project/common/app_images_icons.dart';
import 'package:newware_final_project/common/app_styles.dart';
import 'package:newware_final_project/generated/l10n.dart';
import 'package:newware_final_project/ui/commons/show_confirm.dart';

class Logout extends StatelessWidget {

  final Function()handleLogout;
  const Logout({super.key, required this.handleLogout});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        ConfirmAlert().showLogoutAlert(context,handleLogout);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.secondaryColor,
        ),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppStyles.iconSvgStyle(
              pathImage: AppImages.pathLogoutIcon,
            ),
            const SizedBox(
              width: 10,
            ),
             Text(
              S.of(context).textLogOut,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
