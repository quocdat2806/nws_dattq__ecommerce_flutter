import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newware_final_project/bloc/setting/app_setting_cubit.dart';
import 'package:newware_final_project/common/app_images_icons.dart';
import 'package:newware_final_project/generated/l10n.dart';
import 'package:newware_final_project/ui/pages/profile/widgets/setting_item.dart';

class Setting extends StatelessWidget {
  final Function()? handleTabFormSetting;

  const Setting({super.key, this.handleTabFormSetting});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 1,
          color: const Color(
            0xFFDDDDDD,
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: FormSetting(
                lableText: S.of(context).textLanguage,
                pathIcon: AppImages.pathLanguageImage,
                children: InkWell(
                  onTap: () {
                    (handleTabFormSetting != null)
                        ? handleTabFormSetting!()
                        : null;
                  },
                  child: BlocBuilder<AppSettingCubit, AppSettingState>(
                    builder: (context, state) {
                      return Row(
                        children: [
                          Text(
                            (state.language == 'en') ? 'English' : 'VietNamese',
                          ),
                          const Icon(Icons.navigate_next),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: FormSetting(
                lableText: S.of(context).textNotification,
                pathIcon: AppImages.pathNotificationImage,
                children: CupertinoSwitch(
                  activeColor: Colors.black,
                  value: true,
                  onChanged: (bool value) {},
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: FormSetting(
                lableText: S.of(context).textDarkMood,
                pathIcon: AppImages.pathMoonImage,
                children: Row(
                  children: [
                    Text(S.of(context).textOn),
                    CupertinoSwitch(
                      activeColor: Colors.black,
                      value: true,
                      onChanged: (bool value) {},
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: FormSetting(
                lableText: S.of(context).textHelpCenter,
                pathIcon: AppImages.pathQuestionImage,
                children: const Icon(
                  Icons.navigate_next,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
