import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newware_final_project/models/entities/category/category_entity.dart';
import 'package:newware_final_project/models/enums/load_status.dart';
import 'package:newware_final_project/responsitories/category_responsitory.dart';
import 'package:newware_final_project/ui/pages/home/home_cubit.dart';
import 'package:newware_final_project/ui/pages/home/home_navigator.dart';
import 'package:newware_final_project/ui/pages/home/home_state.dart';
import 'package:newware_final_project/ui/pages/home/widgets/category_item.dart';
import 'package:newware_final_project/ui/pages/home/widgets/search_category.dart';
import 'package:newware_final_project/ui/widget/shimmer/app_grid_shimmer_loading.dart';

class HomePage extends StatefulWidget {
  static const router = 'home';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) {
        final cateRepo = RepositoryProvider.of<CategoryResponsitory>(context);
        final navigator = HomeNavigator(context: context);
        return HomeCubit(navigator: navigator, cateRepo: cateRepo);
      },
      child: const HomeChildPage(),
    );
  }
}

class HomeChildPage extends StatefulWidget {
  const HomeChildPage({super.key});

  @override
  State<HomeChildPage> createState() => _HomeChildPageState();
}

class _HomeChildPageState extends State<HomeChildPage> {
  late HomeCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<HomeCubit>(context);
    _cubit.fetchCategory();
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: _cubit,
      builder: (context, state) {
        int listCategoryLength = state.listFilterCategory.length;
        return state.fetchCategoryStatus == LoadStatus.loading
            ? const AppGridShimmerLoading()
            : Container(
                padding: const EdgeInsets.only(
                  top: 20,
                  right: 20,
                  left: 20,
                  bottom: 0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SearchCategory(
                      searchCategory: _cubit.searchCategory,
                    ),
                    const SizedBox(height: 24),
                    Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.only(bottom: 8),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 3 / 3.45,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: listCategoryLength,
                        itemBuilder: (BuildContext ctx, index) {
                          String categoryName =
                              state.listFilterCategory[index].name ?? '';
                          int categoryId =
                              state.listFilterCategory[index].id ?? 0;
                          CategoryEntity categoryEntity =
                              state.listFilterCategory[index];
                          return CategoryItem(
                            handleTabCategory: () {
                              _cubit.gotoProductListPage(
                                categoryName: categoryName,
                                categoryId: categoryId,
                              );
                            },
                            categoryEntity: categoryEntity,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
