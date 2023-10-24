// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:newware_final_project/common/app_colors.dart';
import 'package:newware_final_project/common/app_styles.dart';
import 'package:newware_final_project/generated/l10n.dart';

class SizeColorProductDetail extends StatelessWidget {
  final listSize;
  final listColor;
  final cubit;
  final state;

  const SizeColorProductDetail({
    super.key,
    required this.cubit,
    required this.state,
    required this.listSize,
    required this.listColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                S.of(context).textSize,
                style: AppStyles.textStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: 'ExtraBold',
                  fontSize: 17,
                ),
              ),
            ),
            Row(
              children: [
                ...List.generate(
                  listSize.length,
                  (index) => InkWell(
                    onTap: () {
                      cubit.handleChangeSize(index);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        right: 6,
                        top: 2,
                      ),
                      constraints: const BoxConstraints(
                        maxWidth: 52,
                        minHeight: 52,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: state.currentSize == index ? Colors.black : null,
                        border: Border.all(
                          width: 1,
                          color: AppColors.greyColor,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          '${listSize[index]}',
                          style: TextStyle(
                            color: state.currentSize == index
                                ? Colors.white
                                : null,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        Container(
          padding: const EdgeInsets.all(9),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              ...List.generate(
                listColor.length,
                (index) => InkWell(
                  onTap: () {
                    cubit.handleChangeColor(index);
                  },
                  child: Container(
                    constraints: const BoxConstraints(
                      minWidth: 28,
                      minHeight: 28,
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      border: index == 0
                          ? Border.all(
                              width: 0.5,
                              color: Colors.grey,
                            )
                          : null,
                      shape: BoxShape.circle,
                      color: Color(
                        getColorIndex(index),
                      ),
                    ),
                    child: state.currentColor == index
                        ? Icon(
                            Icons.check,
                            size: 20,
                            color: index == 1 ? Colors.white : Colors.black,
                          )
                        : const SizedBox.shrink(),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  int getColorIndex(int index) {
    switch (listColor[index]) {
      case 'c1':
        return 0xFFFFFF;
      case 'c2':
        return 0xFF000000;
      case 'c3':
        return 0xFFCACDA8;
      case 'c4':
        return 0xFFF7A01F;
      default:
        return 0xFF000000;
    }
  }
}
