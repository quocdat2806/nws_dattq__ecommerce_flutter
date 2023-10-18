import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:newware_final_project/models/entities/product/product_entity.dart';
import 'package:newware_final_project/models/enums/load_status.dart';
import 'package:newware_final_project/repositories/product_responsitory.dart';
import 'package:newware_final_project/ui/pages/product_list/product_list_navigator.dart';

part 'product_list_state.dart';

class ProductListCubit extends Cubit<ProductListState> {
  final ProductListNavigator navigator;
  final ProductResponsitory proRepo;

  ProductListCubit({required this.navigator, required this.proRepo})
      : super(const ProductListState());

  void fetchProduct(int categoryId) async {
    emit(
      state.copyWith(fetchProductStatus: LoadStatus.loading),
    );
    try {
      final productList = await proRepo.getProductsInCategory(categoryId);
      if (productList != null) {
        emit(
          state.copyWith(
            fetchProductStatus: LoadStatus.success,
            listProduct: productList,
            listFilterProduct: productList,
          ),
        );
      } else {
        emit(
          state.copyWith(
            fetchProductStatus: LoadStatus.failure,
          ),
        );
      }
    } catch (error) {
      emit(
        state.copyWith(
          fetchProductStatus: LoadStatus.failure,
        ),
      );
    }
  }

  void openSearchPage() {
    navigator.openSearchPage(
      searchFunc: searchProduct,
      nameSearch: state.nameSearchProduct,
    );
  }
  void backPage() {
    navigator.pop();
  }

  void openProductDetailPage(int productId) {
    navigator.openProductDetailPage(productId);
  }
  void searchProduct(String nameSearch) {
    if (nameSearch.isEmpty) {
      emit(
        state.copyWith(
          listFilterProduct: state.listProduct,
          nameSearchProduct: '',
        ),
      );
    } else {
      List<ProductEntity> listFilter = [];
      for (int i = 0; i < state.listProduct.length; i++) {
        if (state.listProduct[i].title!.contains(nameSearch)) {
          listFilter.add(state.listProduct[i]);
        }
      }
      emit(
        state.copyWith(
          listFilterProduct: listFilter,
          nameSearchProduct: nameSearch,
        ),
      );
    }
  }
}
