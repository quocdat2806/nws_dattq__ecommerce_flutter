import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newware_final_project/generated/l10n.dart';
import 'package:newware_final_project/models/entities/cart/cart_entity.dart';
import 'package:newware_final_project/models/enums/load_status.dart';
import 'package:newware_final_project/responsitories/user_responsitory.dart';
import 'package:newware_final_project/socket/socket_io.dart';
import 'package:newware_final_project/ui/commons/show_success.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final UserResponsitory userRepo;

  CartCubit({
    required this.userRepo,
  }) : super(const CartState());

  showCheckOutCartSuccess(BuildContext context) {
    if (state.updateCartStatus == LoadStatus.successCheckoutCart) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        SuccessAlert().showSuccessAlert(
          context,
          S.current.textCheckoutCartSuccess,
        );
        deleteCheckoutCartStatus();
      });
    }
  }

  void backPage(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  void fetchCart(int userId) async {
    emit(
      state.copyWith(
          fetchCartStatus: LoadStatus.loading,
          updateCartStatus: LoadStatus.loading),
    );
    try {
      final listCartEntity = await userRepo.getCart(userId);
      if (listCartEntity != null) {
        int totalPrice = handleTotalPriceCart(listCartEntity);
        emit(
          state.copyWith(
            fetchCartStatus: LoadStatus.success,
            listCartEntity: listCartEntity,
            totalPriceCart: totalPrice,
            updateCartStatus: LoadStatus.success,
          ),
        );
      } else {
        emit(
          state.copyWith(
            fetchCartStatus: LoadStatus.failure,
          ),
        );
      }
    } catch (error) {
      emit(
        state.copyWith(
          fetchCartStatus: LoadStatus.failure,
        ),
      );
    }
  }

  void updateCartWhenClose() {
    if (state.listCartEntity.isEmpty) {
      return;
    }
    try {
      userRepo.updateCartWhenClosePage(state.listCartEntity);
    } catch (error) {
      rethrow;
    }
  }

  void deleteCheckoutCartStatus() {
    emit(
      state.copyWith(
        updateCartStatus: LoadStatus.initial,
      ),
    );
  }

  void handleCheckoutCart() async {
    if (state.listCartEntity.isEmpty) {
      return;
    }
    emit(
      state.copyWith(
        updateCartStatus: LoadStatus.loading,
      ),
    );
    Map<String, dynamic>? result = await userRepo.checkoutCart(
      state.listCartEntity,
    );

    var socket = SocketIoConnect().connectAndListen();
    if (socket.connected) {
      socket.emit('checkoutCart');
    }

    if (result != null) {
      emit(
        state.copyWith(
          listCartEntity: [],
          updateCartStatus: LoadStatus.successCheckoutCart,
        ),
      );
    } else {
      emit(
        state.copyWith(
          fetchCartStatus: LoadStatus.failure,
        ),
      );
    }
  }

  void handleIncreseQuantity(index, price) {
    emit(
      state.copyWith(
        updateCartStatus: LoadStatus.loading,
      ),
    );
    List<CartEntity> listCart = List.from(state.listCartEntity);
    int quantity = state.listCartEntity[index].quantity!;
    quantity = quantity + 1;
    listCart[index].total = (quantity * price) as int?;
    listCart[index].quantity = quantity;
    int totalPriceCart = handleTotalPriceCart(listCart);

    emit(
      state.copyWith(
          listCartEntity: listCart,
          updateCartStatus: LoadStatus.success,
          totalPriceCart: totalPriceCart),
    );
  }

  void handleDecreseQuantity(index, price) {
    emit(
      state.copyWith(
        updateCartStatus: LoadStatus.loading,
      ),
    );
    List<CartEntity> listCart = List.from(state.listCartEntity);
    int? quantity = state.listCartEntity[index].quantity;
    quantity = quantity! - 1;
    if (quantity < 1) {
      quantity = 1;
    }
    listCart[index].total = (quantity * price) as int?;
    listCart[index].quantity = quantity;
    int totalPriceCart = handleTotalPriceCart(listCart);
    emit(
      state.copyWith(
          listCartEntity: listCart,
          updateCartStatus: LoadStatus.success,
          totalPriceCart: totalPriceCart),
    );
  }

  int handleTotalPriceCart(List<CartEntity> list) {
    int totalPriceCart = 0;
    for (var element in list) {
      totalPriceCart += element.total!;
    }
    return totalPriceCart;
  }
}
