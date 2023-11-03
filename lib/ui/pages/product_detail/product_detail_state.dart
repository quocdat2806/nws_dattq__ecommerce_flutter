part of 'product_detail_cubit.dart';

class ProductDetailState extends Equatable {
  final LoadStatus loadProductDetalStatus;
  final LoadStatus addtoCartStatus;
  final ProductEntity? productEntity;
  final int? quantity;
  final int? totalPrice;
  final int ?currentImageIndex;
  final int ?currentSizeIndex;
  final int ?currentColorIndex;
  const ProductDetailState({
    this.loadProductDetalStatus = LoadStatus.initial,
    this.addtoCartStatus = LoadStatus.initial,
    this.productEntity,
    this.quantity = 1,
    this.totalPrice=0 ,
    this.currentColorIndex = 0,
    this.currentImageIndex = 0,
    this.currentSizeIndex= 0,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        loadProductDetalStatus,
        productEntity,
        quantity,
        totalPrice,
        currentImageIndex,
        currentColorIndex,
        currentSizeIndex,
        addtoCartStatus,
      ];

  ProductDetailState copyWith({
    LoadStatus? loadProductDetalStatus,
    LoadStatus? addtoCartStatus,
    ProductEntity? productEntity,
    int? quantity,
    int? totalPrice,
    int? currentImageIndex,
    int? currentSizeIndex,
    int? currentColorIndex,
  }) {
    return ProductDetailState(
      loadProductDetalStatus:
          loadProductDetalStatus ?? this.loadProductDetalStatus,
      addtoCartStatus: addtoCartStatus ?? this.addtoCartStatus,
      productEntity: productEntity ?? this.productEntity,
      quantity: quantity ?? this.quantity,
      totalPrice: totalPrice ?? this.totalPrice,
      currentImageIndex: currentImageIndex ?? this.currentImageIndex,
      currentSizeIndex: currentSizeIndex ?? this.currentSizeIndex,
      currentColorIndex: currentColorIndex ?? this.currentColorIndex,
    );
  }
}
