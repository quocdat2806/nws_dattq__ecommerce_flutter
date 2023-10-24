import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newware_final_project/models/entities/cart/cart_entity.dart';
import 'package:newware_final_project/models/enums/load_status.dart';
import 'package:newware_final_project/repositories/user_responsitory.dart';
import 'package:newware_final_project/socket/socket_io.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final UserResponsitory userRepo;

  CartCubit({
    required this.userRepo,
  }) : super(const CartState());

  Future<int> fetchCart(int userId) async {
    emit(
      state.copyWith(fetchCartStatus: LoadStatus.loading),
    );
    try {
      final listCartEntity = await userRepo.getCart(userId);

      if (listCartEntity != null) {
        Future.delayed(const Duration(seconds: 3),(){
          emit(
            state.copyWith(
              fetchCartStatus: LoadStatus.success,
              listCartEntity: listCartEntity,
              updateCartStatus: LoadStatus.success,
            ),
          );
        });

        return state.listCartEntity.length;
      } else {
        emit(
          state.copyWith(
            fetchCartStatus: LoadStatus.failure,
          ),
        );
        return 0;
      }
    } catch (error) {
      emit(
        state.copyWith(
          fetchCartStatus: LoadStatus.failure,
        ),
      );
      return 0;
    }
  }

  void updateCart() {
    if (state.listCartEntity.isEmpty) {
      return;
    }
    try {
      userRepo.updateCartWhenClosePage(state.listCartEntity);
    } catch (error) {
      rethrow;
    }
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
    emit(
      state.copyWith(
        listCartEntity: list,
        updateCartStatus: LoadStatus.success,
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

    emit(
      state.copyWith(
        listCartEntity: list,
        updateCartStatus: LoadStatus.success,
      ),
    );
  }

  int handleTotalPrice() {
    int total = 0;
    for (var element in state.listCartEntity) {
      total += element.total!;
    }
    emit(state.copyWith(totalPriceCart: total));
    return total;
  }
}
