part of 'product_list_cubit.dart';

class ProductListState extends Equatable {
  final  LoadStatus fetchProductStatus;
  final  String nameSearchProduct;
  final  List<ProductEntity>listProduct;
  final  bool clearTextSearch;
  final List<ProductEntity> listFilterProduct;
  const ProductListState({
    this.fetchProductStatus = LoadStatus.initial,
    this.nameSearchProduct = '',
    this.listProduct=const[],
    this.listFilterProduct=const[],
    this.clearTextSearch = false,
  });
  @override
  List<Object?> get props =>[
    fetchProductStatus,
    nameSearchProduct,
    listProduct,
    listFilterProduct,
    clearTextSearch,
  ];

  ProductListState copyWith({
    LoadStatus? fetchProductStatus,
    String? nameSearchProduct,
    List<ProductEntity>? listProduct,
    bool? clearTextSearch,
    List<ProductEntity>? listFilterProduct,
  }) {
    return ProductListState(
      fetchProductStatus: fetchProductStatus ?? this.fetchProductStatus,
      nameSearchProduct: nameSearchProduct ?? this.nameSearchProduct,
      listProduct: listProduct ?? this.listProduct,
      clearTextSearch: clearTextSearch ?? this.clearTextSearch,
      listFilterProduct: listFilterProduct ?? this.listFilterProduct,
    );
  }
}
