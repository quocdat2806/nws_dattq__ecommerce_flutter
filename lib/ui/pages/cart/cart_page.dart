import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newware_final_project/bloc/app_cubit.dart';
import 'package:newware_final_project/common/app_colors.dart';
import 'package:newware_final_project/common/app_images_icons.dart';
import 'package:newware_final_project/common/app_styles.dart';
import 'package:newware_final_project/models/enums/load_status.dart';
import 'package:newware_final_project/repositories/user_responsitory.dart';
import 'package:newware_final_project/ui/commons/show_success.dart';
import 'package:newware_final_project/ui/pages/cart/cart_cubit.dart';
import 'package:newware_final_project/ui/pages/cart/widgets/cart_item.dart';
import 'package:newware_final_project/ui/pages/cart/widgets/checkout_cart.dart';
import 'package:newware_final_project/ui/widget/header_action/header_action.dart';
import 'package:newware_final_project/ui/widget/shimmer/app_shimmer.dart';
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (con) {
        final userRepo = RepositoryProvider.of<UserResponsitory>(context);
        return CartCubit(
          userRepo: userRepo,
        );
      },
      child: BlocBuilder<AppCubit, AppState>(builder: (context, state) {
        int? userId = state.user!.id;
        return CartChildPageState(
          userId: userId,
        );
      }),
    );
  }
}

class CartChildPageState extends StatefulWidget {
  final int? userId;

  const CartChildPageState({super.key, required this.userId});

  @override
  State<CartChildPageState> createState() => _CartChildPageStateState();
}

class _CartChildPageStateState extends State<CartChildPageState> {
  late CartCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<CartCubit>(context);
    _cubit.fetchCart(widget.userId!);
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      bloc: _cubit,
      buildWhen: (previous, current) =>
          previous.updateCartStatus != current.updateCartStatus,
      builder: (context, state) {
        if (state.updateCartStatus == LoadStatus.successCheckout) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            SuccessAlert().showSuccessAlert(context,'Bạn đã checkout thành công');
          });
        }
        return state.fetchCartStatus == LoadStatus.loading
            ? const AppShimmer()
            : Scaffold(
                body: SafeArea(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeaderAction(
                              pathIconLeft: AppImages.pathBackImage,
                              childrenIconRight: Container(
                                constraints: const BoxConstraints(
                                  minWidth: 44,
                                  minHeight: 44,
                                ),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'My Cart',
                            style: AppStyles.textStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'ExtraBold',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        state.listCartEntity.isEmpty
                            ? const Center(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Your Cart is empty! Please Add to Cart',
                                  ),
                                ),
                              )
                            : Expanded(
                                child: SizedBox(
                                  child: ListView.builder(
                                    itemCount: state.listCartEntity.length,
                                    itemBuilder: (context, index) {
                                      return CartItem(
                                        state: state,
                                        index: index,
                                        cubit: _cubit,
                                      );
                                    },
                                  ),
                                ),
                              ),
                        state.listCartEntity.isNotEmpty
                            ? CheckOutCart(
                                state: state,
                                cubit: _cubit,
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
