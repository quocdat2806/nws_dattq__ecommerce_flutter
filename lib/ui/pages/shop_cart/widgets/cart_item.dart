// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:newware_final_project/common/app_colors.dart';
import 'package:newware_final_project/common/app_styles.dart';
import 'package:newware_final_project/models/entities/cart/cart_entity.dart';

class CartItem extends StatelessWidget {
  final CartEntity cartEntity;
  final Function()? handleDecreseQuantity;
  final Function()? handleIncreseQuantity;

  const CartItem({
    super.key,
    required this.cartEntity,
    this.handleDecreseQuantity,
    this.handleIncreseQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(cartEntity.image ?? ''),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(height: 6),
                Text(
                  cartEntity.productEntity?.title ?? '',
                  style: AppStyles.textStyle(
                    fontFamily: 'Bold',
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                  maxLines: 1,
                ),
                Text(
                  cartEntity.productEntity?.description ??
                      ''
                          'Vlado Odelle',
                  style: AppStyles.textStyle(
                    fontSize: 14,
                    color: AppColors.greyColor_1,
                  ),
                  maxLines: 1,
                ),
                const SizedBox(height: 22),
                Text(
                  '\$${cartEntity.total}.00',
                  style: AppStyles.textStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'ExtraBold',
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color(0xFFEEEEEE),
            ),
            margin: const EdgeInsets.only(top: 50),
            child: Row(
              children: [
                InkWell(
                  onTap: handleDecreseQuantity,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 4,
                    ),
                    child: Text(
                      '-',
                      style: AppStyles.textStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  '${cartEntity.quantity}',
                  style: AppStyles.textStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: handleIncreseQuantity,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    child: InkWell(
                      child: Text(
                        '+',
                        style: AppStyles.textStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
