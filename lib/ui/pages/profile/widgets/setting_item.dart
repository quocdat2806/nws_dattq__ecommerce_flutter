import 'package:flutter/material.dart';
import 'package:newware_final_project/common/app_styles.dart';

class FormSetting extends StatelessWidget {
  final String? lableText;
  final String? pathIcon;
  final Widget? children;

  const FormSetting({super.key, this.lableText, this.pathIcon, this.children});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              constraints: const BoxConstraints(
                minWidth: 44,
                minHeight: 44,
              ),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFFDDDDDD),
              ),
              child: AppStyles.iconSvgStyle(
                pathImage: pathIcon,
              ),
            ),
            const SizedBox(width: 10),
            Text(lableText!),
          ],
        ),
        children ?? const SizedBox.shrink(),
      ],
    );
  }
}
