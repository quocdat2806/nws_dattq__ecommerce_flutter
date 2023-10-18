import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newware_final_project/models/entities/category/category_entity.dart';
import 'package:newware_final_project/models/enums/load_status.dart';
import 'package:newware_final_project/repositories/category_responsitory.dart';
import 'package:newware_final_project/ui/pages/home/home_navigator.dart';
import 'package:newware_final_project/ui/pages/home/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeNavigator navigator;
  final CategoryResponsitory cateRepo;

  HomeCubit({
    required this.navigator,
    required this.cateRepo,
  }) : super(const HomeState());

  void fetchCategory() async {
    emit(
      state.copyWith(
        fetchCategoryStatus: LoadStatus.loading,
      ),
    );
    try {
      final categoryList = await cateRepo.getAllCategory();
      if (categoryList != null) {
        emit(
          state.copyWith(
            fetchCategoryStatus: LoadStatus.success,
            listCategory: categoryList,
            listFilterCategory: categoryList,
          ),
        );
      } else {
        emit(
          state.copyWith(
            fetchCategoryStatus: LoadStatus.failure,
          ),
        );
      }
    } catch (error) {
      emit(
        state.copyWith(
          fetchCategoryStatus: LoadStatus.failure,
        ),
      );
    }
  }

  void searchCategory(String nameCategory) {
    if (nameCategory.isEmpty) {
      emit(
        state.copyWith(
          listFilterCategory: state.listCategory,
        ),
      );
    } else {
      List<CategoryEntity> listFilter = [];
      for (int i = 0; i < state.listCategory.length; i++) {
        if (state.listCategory[i].name!.contains(nameCategory)) {
          listFilter.add(state.listCategory[i]);
        }
      }
      emit(
        state.copyWith(
          listFilterCategory: listFilter,
        ),
      );
    }
  }

  void gotoProductListPage({
    categoryName,
    categoryId,
  }) {
    navigator.openProductListPage(
      categoryName: categoryName,
      categoryId: categoryId,
    );
  }
}
