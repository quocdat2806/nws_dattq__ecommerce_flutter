
import 'package:equatable/equatable.dart';
import 'package:newware_final_project/models/entities/category/category_entity.dart';
import 'package:newware_final_project/models/enums/load_status.dart';
class  HomeState  extends Equatable {
final  LoadStatus fetchCategoryStatus;
final  String nameSearchCategory;
final  List<CategoryEntity>listCategory;
final List<CategoryEntity> listFilterCategory;
  const HomeState({
    this.fetchCategoryStatus = LoadStatus.initial,
    this.nameSearchCategory = '',
    this.listCategory=const[],
    this.listFilterCategory=const[],
  });
  @override
  List<Object?> get props => [
    fetchCategoryStatus,
    nameSearchCategory,
    listCategory,
    listFilterCategory
  ];

HomeState copyWith({
    LoadStatus? fetchCategoryStatus,
    String? nameSearchCategory,
    List<CategoryEntity>? listCategory,
    List<CategoryEntity>? listFilterCategory,
  }) {
    return HomeState(
      fetchCategoryStatus: fetchCategoryStatus ?? this.fetchCategoryStatus,
      nameSearchCategory: nameSearchCategory ?? this.nameSearchCategory,
      listCategory: listCategory ?? this.listCategory,
      listFilterCategory: listFilterCategory ?? this.listFilterCategory,
    );
  }
}
