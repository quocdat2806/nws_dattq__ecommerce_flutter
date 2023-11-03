import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newware_final_project/bloc/app_cubit.dart';
import 'package:newware_final_project/common/app_images_icons.dart';
import 'package:newware_final_project/common/app_styles.dart';
import 'package:newware_final_project/generated/l10n.dart';
import 'package:newware_final_project/models/entities/cart/cart_entity.dart';
import 'package:newware_final_project/models/enums/load_status.dart';
import 'package:newware_final_project/responsitories/user_responsitory.dart';
import 'package:newware_final_project/ui/pages/shop_cart/cart_cubit.dart';
import 'package:newware_final_project/ui/pages/shop_cart/widgets/cart_item.dart';
import 'package:newware_final_project/ui/pages/shop_cart/widgets/checkout_cart.dart';
import 'package:newware_final_project/ui/widget/header_action/header_action.dart';
import 'package:newware_final_project/ui/widget/loading/circular_loading.dart';

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
        int? userId = state.user?.id;
        return CartChildPage(
          userId: userId,
        );
      }),
    );
  }
}

class CartChildPage extends StatefulWidget {
  final int? userId;

  const CartChildPage({super.key, required this.userId});

  @override
  State<CartChildPage> createState() => _CartChildPageState();
}

class _CartChildPageState extends State<CartChildPage> {
  late CartCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<CartCubit>(context);
    _cubit.fetchCart(widget.userId ?? 0);
  }

  @override
  void dispose() {
    _cubit.updateCartWhenClose();
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: invalid_use_of_protected_member
    final hasActiveRouteBelow = ModalRoute.of(context)?.hasActiveRouteBelow;

    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(
          const Duration(seconds: 3),
          () {
            _cubit.fetchCart(widget.userId!);
          },
        );
      },
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<CartCubit, CartState>(
            bloc: _cubit,
            buildWhen: (previous, current) =>
                previous.updateCartStatus != current.updateCartStatus,
            builder: (context, state) {
              _cubit.showCheckOutCartSuccess(context);
              return state.fetchCartStatus == LoadStatus.loading
                  ? const CircularLoading()
                  : Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                            right: 20,
                            left: 20,
                            bottom: 10,
                            top: 20,
                          ),
                          child: HeaderAction(
                            handleTabLeftIcon: () {
                              _cubit.backPage(context);
                            },
                            pathIconLeft: hasActiveRouteBelow == true
                                ? AppImages.pathBackImage
                                : null,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 20, bottom: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              S.of(context).textMyCart,
                              style: AppStyles.textStyle(
                                fontFamily: 'ExtraBold',
                                fontWeight: FontWeight.w900,
                                fontSize: 23,
                              ),
                            ),
                          ),
                        ),
                        state.listCartEntity.isNotEmpty
                            ? const SizedBox.shrink()
                            : Center(
                                child: Text(
                                  S.current.textCartEmpty,
                                ),
                              ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: ListView.builder(
                              itemCount: state.listCartEntity.length,
                              itemBuilder: (context, index) {
                                CartEntity cartEntity =
                                    state.listCartEntity[index];
                                int? price = state
                                    .listCartEntity[index].productEntity?.price;
                                return CartItem(
                                  handleDecreseQuantity: () {
                                    _cubit.handleDecreseQuantity(index, price);
                                  },
                                  handleIncreseQuantity: () {
                                    _cubit.handleIncreseQuantity(index, price);
                                  },
                                  cartEntity: cartEntity,
                                );
                              },
                            ),
                          ),
                        ),
                        state.listCartEntity.isNotEmpty
                            ? CheckOutCart(
                                lengthItemCart: state.listCartEntity.length,
                                totalPriceCart: state.totalPriceCart,
                                handleCheckoutCart: _cubit.handleCheckoutCart,
                              )
                            : const SizedBox.shrink(),
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}
