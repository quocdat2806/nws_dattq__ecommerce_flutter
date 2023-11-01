import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newware_final_project/generated/l10n.dart';
import 'package:newware_final_project/models/entities/cart/cart_entity.dart';
import 'package:newware_final_project/models/entities/product/product_entity.dart';
import 'package:newware_final_project/models/entities/user/user_entity.dart';
import 'package:newware_final_project/models/enums/load_status.dart';
import 'package:newware_final_project/responsitories/product_responsitory.dart';
import 'package:newware_final_project/responsitories/user_responsitory.dart';
import 'package:newware_final_project/socket/socket_io.dart';
import 'package:newware_final_project/ui/commons/show_error.dart';
import 'package:newware_final_project/ui/commons/show_success.dart';
import 'package:newware_final_project/ui/pages/product_detail/product_detail_navigator.dart';

part 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  final ProductDetailNavigator navigator;
  final ProductResponsitory proRepo;
  final UserResponsitory userRepo;

  ProductDetailCubit({
    required this.navigator,
    required this.proRepo,
    required this.userRepo,
  }) : super(const ProductDetailState());

  void fetchProductDetail(int productId) async {
    emit(
      state.copyWith(
        loadProductDetalStatus: LoadStatus.loading,
      ),
    );
    try {
      final productEntity = await proRepo.getProductById(
        productId,
      );
      if (productEntity != null) {
        int ?totalPrice = productEntity.price??0 * state.quantity!;
        emit(
          state.copyWith(
              productEntity: productEntity,
              loadProductDetalStatus: LoadStatus.success,
              totalPrice: totalPrice
          ),
        );
      } else {
        emit(
          state.copyWith(
            loadProductDetalStatus: LoadStatus.failure,
          ),
        );
      }
    } catch (error) {
      emit(
        state.copyWith(
          loadProductDetalStatus: LoadStatus.failure,
        ),
      );
    }
  }

  void handleIncresementCouting({
    int? price,
  }) {
    int quantity = state.quantity!;
    int total = state.totalPrice! ;
    total += price!;
    emit(
      state.copyWith(
        quantity: ++quantity,
        totalPrice: total,
      ),
    );
  }

//decresement quantity
  void handleDecresementCouting({
    int? price,
  }) {
    int quantity = state.quantity!;
    quantity = --quantity;
    if (quantity < 1) {
      quantity = 1;
      return;
    }
    int total = state.totalPrice! ;
    total -= price!;
    emit(
      state.copyWith(
        quantity: quantity,
        totalPrice: total,
      ),
    );
  }


  void openCartPage() {
    navigator.openCartPage();
  }

  void backPage() {
    navigator.pop();
  }

  void handleAddToCart({
    UserEntity? userEntity,
    ProductEntity? productEntity,
  }) async {
    CartEntity cartEntity = CartEntity(
      userEntity: userEntity!,
      productEntity: productEntity!,
      image: state.productEntity!.images![state.currentImage!],
      quantity: state.quantity,
      total: state.totalPrice,
    );
    Map<String, dynamic>? result = await userRepo.addToCart(
      cartEntity,
    );
    if (result != null) {
      var socket = SocketIoConnect().connectAndListen();
      if (socket.connected) {
        socket.emit('addToCart');
      }
      emit(
        state.copyWith(
          loadAddtoCartStatus: LoadStatus.successAddToCart,
          quantity: 1,
        ),
      );
    } else {
      emit(
        state.copyWith(loadAddtoCartStatus: LoadStatus.failure),
      );
    }
  }

  void deleteAddToCartStatus() {
    emit(
      state.copyWith(
        loadAddtoCartStatus: LoadStatus.initial,
      ),
    );
  }

  void showSuccessAddToCart(BuildContext context) {
    if (state.loadAddtoCartStatus == LoadStatus.successAddToCart) {
      WidgetsBinding.instance.addPostFrameCallback(
            (_) {
          SuccessAlert().showSuccessAlert(
            context,
            S.current.textAddToCartSuccess,
          );
        },
      );
      deleteAddToCartStatus();
    }
    if (state.loadAddtoCartStatus == LoadStatus.failure) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ErrorAlert().showError(context);
      });
    }
  }

//change size
  void handleChangeSize(int indexSize) {
    emit(
      state.copyWith(
        currentSize: indexSize,
      ),
    );
  }

  // change image
  void handleChangImage(int indexImage) {
    emit(
      state.copyWith(
        currentImage: indexImage,
      ),
    );
  }

//change color
  void handleChangeColor(int indexSize) {
    emit(
      state.copyWith(
        currentColor: indexSize,
      ),
    );
  }
}
