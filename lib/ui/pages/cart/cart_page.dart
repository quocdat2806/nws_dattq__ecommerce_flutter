import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newware_final_project/bloc/app_cubit.dart';
import 'package:newware_final_project/common/app_images_icons.dart';
import 'package:newware_final_project/common/app_styles.dart';
import 'package:newware_final_project/generated/l10n.dart';
import 'package:newware_final_project/models/enums/load_status.dart';
import 'package:newware_final_project/repositories/user_responsitory.dart';
import 'package:newware_final_project/ui/pages/cart/cart_cubit.dart';
import 'package:newware_final_project/ui/pages/cart/widgets/cart_item.dart';
import 'package:newware_final_project/ui/pages/cart/widgets/checkout_cart.dart';
import 'package:newware_final_project/ui/widget/header_action/header_action.dart';
import 'package:newware_final_project/ui/widget/loading/loading_status.dart';

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

class _CartChildPageStateState extends State<CartChildPageState>
    with AutomaticKeepAliveClientMixin {
  late CartCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<CartCubit>(context);
    _cubit.fetchLengthCart(widget.userId!);
  }

  @override
  void dispose() {
    _cubit.updateCart();
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(
          const Duration(seconds: 3),
          () {
            _cubit.fetchLengthCart(widget.userId!);
          },
        );
      },
      child: BlocBuilder<CartCubit, CartState>(
        bloc: _cubit,
        buildWhen: (previous, current) =>
            previous.updateCartStatus != current.updateCartStatus,
        builder: (context, state) {
        _cubit.handleCheckOutCartSuccess(context);
          return state.fetchCartStatus == LoadStatus.loading
              ? const LoadingStatus()
              : Scaffold(
                  body: SafeArea(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                            right: 20,
                            left: 20,
                            bottom: 10,
                            top: 20,
                          ),
                          child: const HeaderAction(
                            pathIconLeft: AppImages.pathBackImage,
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
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
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
                );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
