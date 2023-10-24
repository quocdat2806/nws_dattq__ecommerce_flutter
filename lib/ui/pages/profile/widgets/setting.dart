import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newware_final_project/common/app_images_icons.dart';
import 'package:newware_final_project/ui/pages/profile/widgets/form_setting.dart';

class Setting extends StatelessWidget {
  final Function()? onTabLanguage;
  const Setting({super.key, this.onTabLanguage});
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
                lableText: 'Language',
                pathIcon: AppImages.pathLanguageImage,
                children: InkWell(
                  onTap: () {
                    (onTabLanguage!=null) ? onTabLanguage!():null;
                  },
                  child: const Row(
                    children: [
                      Text('English'),
                      Icon(Icons.navigate_next),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: FormSetting(
                lableText: 'Notification',
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
                lableText: 'Dark Mood',
                pathIcon: AppImages.pathMoonImage,
                children: Row(
                  children: [
                    const Text('off'),
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
              child: const FormSetting(
                lableText: 'Help Center',
                pathIcon: AppImages.pathQuestionImage,
                children: Icon(
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
