part of 'product_detail_cubit.dart';

class ProductDetailState extends Equatable {
  final LoadStatus loadProductDetalStatus;
  final LoadStatus loadAddtoCartStatus;
  final ProductEntity? productEntity;
  final int? defaultQuantity;
  final int? totalPrice;
  final int ?currentImage;
  final int ?currentSize;
  final int ?currentColor;
  const ProductDetailState({
    this.loadProductDetalStatus = LoadStatus.initial,
    this.loadAddtoCartStatus = LoadStatus.initial,
    this.productEntity,
    this.defaultQuantity = 1,
    this.totalPrice=0 ,
    this.currentColor = 0,
    this.currentImage = 0,
    this.currentSize= 0,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        loadProductDetalStatus,
        productEntity,
        defaultQuantity,
        totalPrice,
        currentImage,
        currentColor,
        currentSize,
        loadAddtoCartStatus,
      ];

  ProductDetailState copyWith({
    LoadStatus? loadProductDetalStatus,
    LoadStatus? loadAddtoCartStatus,
    ProductEntity? productEntity,
    int? defaultQuantity,
    int? totalPrice,
    int? currentImage,
    int? currentSize,
    int? currentColor,
  }) {
    return ProductDetailState(
      loadProductDetalStatus:
          loadProductDetalStatus ?? this.loadProductDetalStatus,
      loadAddtoCartStatus: loadAddtoCartStatus ?? this.loadAddtoCartStatus,
      productEntity: productEntity ?? this.productEntity,
      defaultQuantity: defaultQuantity ?? this.defaultQuantity,
      totalPrice: totalPrice ?? this.totalPrice,
      currentImage: currentImage ?? this.currentImage,
      currentSize: currentSize ?? this.currentSize,
      currentColor: currentColor ?? this.currentColor,
    );
  }
}
