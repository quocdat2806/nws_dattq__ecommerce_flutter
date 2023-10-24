// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newware_final_project/common/app_styles.dart';

class BottomNavigationItem extends StatelessWidget {
  final Function(int index)? onTabItem;
  final Function? clearNotifyFun;
  final state;
  final int? index;
  final String? title;
  final String? pathIcon;
  final bool hasNotify;
  final int? quantityNotify;

  const BottomNavigationItem({
    super.key,
    this.index,
    this.onTabItem,
    this.state,
    this.title,
    this.pathIcon,
    this.hasNotify = false,
    this.quantityNotify,
    this.clearNotifyFun,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTabItem!(index!);
        if (clearNotifyFun != null) {
          clearNotifyFun!();
        }
      },
      child: Stack(
        children: [
          hasNotify
              ? Positioned(
                  top: -4,
                  right: 0,
                  child: Text(
                    quantityNotify != 0 ? '$quantityNotify' : "",
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'ExtraBold',
                    ),
                  ),
                )
              : const SizedBox.shrink(),
          AnimatedContainer(
            duration: const Duration(seconds: 2),
            child: Container(
              padding: state.selectedIndex == index
                  ? const EdgeInsets.only(right: 8)
                  : null,
              decoration: BoxDecoration(
                borderRadius: state.selectedIndex == index
                    ? BorderRadius.circular(16)
                    : null,
                color: state.selectedIndex == index
                    ? const Color(
                        0xFFEEEEEE,
                      )
                    : null,
              ),
              child: Row(
                children: [
                  Container(
                    padding: state.selectedIndex == index
                        ? const EdgeInsets.all(10)
                        : null,
                    decoration: BoxDecoration(
                      color: state.selectedIndex == index ? Colors.black : null,
                      shape: state.selectedIndex == index
                          ? BoxShape.circle
                          : BoxShape.rectangle,
                    ),
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          pathIcon!,
                          width: 20,
                          height: 20,
                          // ignore: deprecated_member_use
                          color: state.selectedIndex == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 7),
                  Text(
                    state.selectedIndex == index ? title ?? '' : '',
                    style: AppStyles.textStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
