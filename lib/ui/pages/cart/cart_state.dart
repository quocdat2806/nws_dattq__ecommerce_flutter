part of 'cart_cubit.dart';

class CartState extends Equatable {
  final List<CartEntity> listCartEntity;
  final LoadStatus updateCartStatus;
  final LoadStatus fetchCartStatus;
  final int totalPriceCart;

  const CartState({
    this.listCartEntity = const [],
    this.fetchCartStatus = LoadStatus.initial,
    this.updateCartStatus = LoadStatus.initial,
    this.totalPriceCart = 0,
  });

  @override
  List<Object?> get props => [
        listCartEntity,
        fetchCartStatus,
        totalPriceCart,
        updateCartStatus,
      ];

  CartState copyWith({
    List<CartEntity>? listCartEntity,
    LoadStatus? updateCartStatus,
    LoadStatus? fetchCartStatus,
    int? totalPriceCart,
  }) {
    return CartState(
      listCartEntity: listCartEntity ?? this.listCartEntity,
      updateCartStatus: updateCartStatus ?? this.updateCartStatus,
      fetchCartStatus: fetchCartStatus ?? this.fetchCartStatus,
      totalPriceCart: totalPriceCart ?? this.totalPriceCart,
    );
  }
}
