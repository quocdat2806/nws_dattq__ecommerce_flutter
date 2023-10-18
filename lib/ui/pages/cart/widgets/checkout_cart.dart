// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newware_final_project/common/app_colors.dart';

class CheckOutCart extends StatelessWidget {
  final state;
  final cubit;


  const CheckOutCart({super.key, this.state, this.cubit});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total ${state.listCartEntity.length} item ',
            ),
            Text('${cubit.handleTotalPrice()}.00')
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: state.listCartEntity.isNotEmpty
                ? AppColors.secondaryColor
                : AppColors.greyColor,
          ),
          width: MediaQuery.of(context).size.width,
          child: InkWell(
            onTap: () {
              if (state.listCartEntity.isEmpty) {
                return;
              }
              cubit.handleCheckout();
            },
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Process To Checkout',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                SvgPicture.asset(
                  'assets/icons/arrownext.svg',
                  width: 20,
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
