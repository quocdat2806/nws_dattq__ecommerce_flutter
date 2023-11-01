// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newware_final_project/common/app_styles.dart';

class BottomNavigationItem extends StatelessWidget {
  final Function(int index)? onTabItem;
  final Function? handleClearNotify;
  final int? index;
  final String? title;
  final String? pathIconNavigation;
  final bool hasNotify;
  final int? quantityNotify;
  final bool? isActivePage;

  const BottomNavigationItem({
    super.key,
    this.index,
    this.onTabItem,
    this.title,
    this.pathIconNavigation,
    this.hasNotify = false,
    this.quantityNotify,
    this.handleClearNotify,
    this.isActivePage = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTabItem!(index!);
        if (handleClearNotify != null) {
          handleClearNotify!();
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
              padding: isActivePage??false
                  ? const EdgeInsets.only(right: 8)
                  : null,
              decoration: BoxDecoration(
                borderRadius: isActivePage??false
                    ? BorderRadius.circular(16)
                    : null,
                color: isActivePage??false
                    ? const Color(
                        0xFFEEEEEE,
                      )
                    : null,
              ),
              child: Row(
                children: [
                  Container(
                    padding: isActivePage??false
                        ? const EdgeInsets.all(10)
                        : null,
                    decoration: BoxDecoration(
                      color: isActivePage??false ? Colors.black : null,
                      shape: isActivePage??false
                          ? BoxShape.circle
                          : BoxShape.rectangle,
                    ),
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3),
                          child: SvgPicture.asset(
                            pathIconNavigation!,
                            width: 20,
                            height: 20,
                            // ignore: deprecated_member_use
                            color: isActivePage??false
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 7),
                  Text(
                    isActivePage??false ? title ?? '' : '',
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
