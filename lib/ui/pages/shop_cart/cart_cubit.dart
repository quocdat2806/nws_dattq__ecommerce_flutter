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
  handleCheckOutCartSuccess(BuildContext context){
    if (state.updateCartStatus == LoadStatus.successCheckout) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        SuccessAlert().showSuccessAlert(
          context,
          S.current.textCheckoutCartSuccess,
        );
        deleteCheckoutCartStatus();
      });
    }
  }

  void backPage(BuildContext context){
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }
  void fetchCart(int userId) async {
    emit(
      state.copyWith(
        fetchCartStatus: LoadStatus.loading,
      ),
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
  void deleteCheckoutCartStatus(){
    emit(
      state.copyWith(
        updateCartStatus: LoadStatus.initial,
      ),
    );
  }
  void handleCheckout() async {
    if (state.listCartEntity.isEmpty) {
      return;
    }
    Map<String, dynamic>? result = await userRepo.checkoutCart(
      state.listCartEntity,
    );

    var socket = SocketIoConnect().connectAndListen();
    if (socket.connected) {
      socket.emit('checkoutCart');
    }
    emit(
      state.copyWith(
        updateCartStatus: LoadStatus.loading,
      ),
    );
    if (result != null) {
      emit(
        state.copyWith(
          listCartEntity: [],
          updateCartStatus: LoadStatus.successCheckout,
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
    emit(state.copyWith(updateCartStatus: LoadStatus.loading));
    List<CartEntity> list = List.from(state.listCartEntity);
    int quantity = state.listCartEntity[index].quantity!;
    quantity = quantity + 1;
    list[index].total = (quantity * price) as int?;
    list[index].quantity = quantity;
    int totalPrice = handleTotalPriceCart(list);

    emit(
      state.copyWith(
        listCartEntity: list,
        updateCartStatus: LoadStatus.success,
        totalPriceCart: totalPrice
      ),
    );
  }

  void handleDecreseQuantity(index, price) {
    emit(
      state.copyWith(
        updateCartStatus: LoadStatus.loading,
      ),
    );
    List<CartEntity> list = List.from(state.listCartEntity);
    int? quantity = state.listCartEntity[index].quantity;
    quantity = quantity! - 1;
    if (quantity < 1) {
      quantity = 1;
    }
    list[index].total = (quantity * price) as int?;
    list[index].quantity = quantity;
    int totalPrice = handleTotalPriceCart(list);
    emit(
      state.copyWith(
        listCartEntity: list,
        updateCartStatus: LoadStatus.success,
        totalPriceCart: totalPrice
      ),
    );
  }

  int handleTotalPriceCart(List<CartEntity>list) {
    int total = 0;
    for (var element in list) {
      total += element.total!;
    }
    return total;
  }
}