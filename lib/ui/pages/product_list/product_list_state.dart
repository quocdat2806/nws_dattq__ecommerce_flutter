part of 'product_list_cubit.dart';

class ProductListState extends Equatable {
  final  LoadStatus fetchProductStatus;
  final  LoadStatus loadMoreStatus;
  final  String nameSearchProduct;
  final  List<ProductEntity>listProduct;
  final List<ProductEntity> listFilterProduct;
  final int offset;
  const ProductListState({
    this.fetchProductStatus = LoadStatus.initial,
    this.nameSearchProduct = '',
    this.listProduct=const[],
    this.listFilterProduct=const[],
    this.offset = 0,
    this.loadMoreStatus = LoadStatus.initial
  });
  @override
  List<Object?> get props =>[
    fetchProductStatus,
    nameSearchProduct,
    listProduct,
    listFilterProduct,
    offset,
    loadMoreStatus
  ];

  ProductListState copyWith({
    LoadStatus? fetchProductStatus,
    LoadStatus? loadMoreStatus,
    String? nameSearchProduct,
    List<ProductEntity>? listProduct,
    List<ProductEntity>? listFilterProduct,
    int? offset,
  }) {
    return ProductListState(
      fetchProductStatus: fetchProductStatus ?? this.fetchProductStatus,
      loadMoreStatus: loadMoreStatus ?? this.loadMoreStatus,
      nameSearchProduct: nameSearchProduct ?? this.nameSearchProduct,
      listProduct: listProduct ?? this.listProduct,
      listFilterProduct: listFilterProduct ?? this.listFilterProduct,
      offset: offset ?? this.offset,
    );
  }
}
