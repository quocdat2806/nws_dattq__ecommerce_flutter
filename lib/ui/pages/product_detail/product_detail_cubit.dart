import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newware_final_project/models/entities/cart/cart_entity.dart';
import 'package:newware_final_project/models/entities/product/product_entity.dart';
import 'package:newware_final_project/models/entities/user/user_entity.dart';
import 'package:newware_final_project/models/enums/load_status.dart';
import 'package:newware_final_project/repositories/product_responsitory.dart';
import 'package:newware_final_project/repositories/user_responsitory.dart';
import 'package:newware_final_project/socket/socket_io.dart';
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
    await proRepo.getProductById(
      productId,
    );
    try {
      final productEntity = await proRepo.getProductById(
        productId,
      );
      if (productEntity != null) {
        emit(
          state.copyWith(
            productEntity: productEntity,
            loadProductDetalStatus: LoadStatus.success,
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
    if (state.loadAddtoCartStatus == LoadStatus.successAddToCart) {
      return;
    }
    emit(
      state.copyWith(
        quantity: ++quantity,
        totalPrice: price! * state.quantity!,
      ),
    );
  }

  void handleChangImage(int indexImage) {
    if (state.loadAddtoCartStatus == LoadStatus.successAddToCart) {
      return;
    }
    emit(
      state.copyWith(
        currentImage: indexImage,
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
    emit(
      state.copyWith(
        loadAddtoCartStatus: LoadStatus.loading,
      ),
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
          ),
        );
    } else {
      emit(
        state.copyWith(loadAddtoCartStatus: LoadStatus.failure),
      );
    }
  }

  void handleDecresementCouting({
    int? price,
  }) {
    if (state.loadAddtoCartStatus == LoadStatus.successAddToCart) {
      return;
    }
    int quantity = state.quantity!;
    quantity = --quantity;
    if (quantity < 1) {
      quantity = 1;
    }
    emit(
      state.copyWith(
        quantity: quantity,
        totalPrice: price! * state.quantity!,
      ),
    );
  }

  void handleChangeSize(int indexSize) {
    if (state.loadAddtoCartStatus == LoadStatus.successAddToCart) {
      return;
    }
    emit(
      state.copyWith(
        currentSize: indexSize,
      ),
    );
  }

  void handleChangeColor(int indexSize) {
    if (state.loadAddtoCartStatus == LoadStatus.successAddToCart) {
      return;
    }
    emit(
      state.copyWith(
        currentColor: indexSize,
      ),
    );
  }

  num handleTotalPrice({int? price}) {
    emit(
      state.copyWith(
        totalPrice: price! * state.quantity!,
      ),
    );
    return price * state.quantity!;
  }
}
