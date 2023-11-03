import 'package:flutter/material.dart';
import 'package:newware_final_project/common/app_styles.dart';

class HeaderAction extends StatelessWidget {
  final Function()? handleTabRightIcon;
  final Function()? handleTabLeftIcon;
  final String? pathIconLeft;
  final Widget? iconRight;

  const HeaderAction({
    super.key,
    this.handleTabRightIcon,
    this.pathIconLeft,
    this.iconRight,
    this.handleTabLeftIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            (handleTabLeftIcon!=null) ? handleTabLeftIcon!():null;
          },
          child: pathIconLeft !=null? AppStyles.iconSvgStyle(
            pathImage: pathIconLeft,
            width: 35.0,
            height: 35.0,
          ):const SizedBox.shrink(),
        ),
        InkWell(
          onTap: ()  {
            (handleTabRightIcon!=null) ? handleTabRightIcon!():null;
          },
          child: iconRight ?? const SizedBox.shrink(),
        ),
      ],
    );
  }
}
