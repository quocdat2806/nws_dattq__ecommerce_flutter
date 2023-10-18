import 'package:flutter/material.dart';
import 'package:newware_final_project/common/app_styles.dart';

class HeaderAction extends StatefulWidget {
  final Function()? onTabRightIcon;
  final Function()? onTabLeftIcon;
  final String? pathIconLeft;
  final Widget? childrenIconRight;

  const HeaderAction({
    super.key,
    this.onTabRightIcon,
    this.pathIconLeft,
    this.childrenIconRight,
    this.onTabLeftIcon,
  });

  @override
  State<HeaderAction> createState() => _HeaderActionState();
}

class _HeaderActionState extends State<HeaderAction> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            widget.onTabLeftIcon!();
          },
          child: AppStyles.iconSvgStyle(
            pathImage: widget.pathIconLeft,
            width: 35.0,
            height: 35.0,
          ),
        ),
        InkWell(
          onTap: () async {
            widget.onTabRightIcon!();
          },
          child: widget.childrenIconRight ?? const SizedBox.shrink(),
        ),
      ],
    );
  }
}
