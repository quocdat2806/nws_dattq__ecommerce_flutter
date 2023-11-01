import 'package:flutter/material.dart';
import 'package:newware_final_project/common/app_styles.dart';

class HeaderAction extends StatelessWidget {
  final Function()? onTabRightIcon;
  final Function()? onTabLeftIcon;
  final String? pathIconLeft;
  final Widget? iconRight;

  const HeaderAction({
    super.key,
    this.onTabRightIcon,
    this.pathIconLeft,
    this.iconRight,
    this.onTabLeftIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            (onTabLeftIcon!=null) ? onTabLeftIcon!():null;
          },
          child: pathIconLeft !=null? AppStyles.iconSvgStyle(
            pathImage: pathIconLeft,
            width: 35.0,
            height: 35.0,
          ):const SizedBox.shrink(),
        ),
        InkWell(
          onTap: ()  {
            (onTabRightIcon!=null) ? onTabRightIcon!():null;
          },
          child: iconRight ?? const SizedBox.shrink(),
        ),
      ],
    );
  }
}
