import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newware_final_project/common/app_images_icons.dart';
import 'package:newware_final_project/common/app_styles.dart';
import 'package:newware_final_project/models/enums/load_status.dart';
import 'package:newware_final_project/ui/pages/home/home_cubit.dart';
import 'package:newware_final_project/ui/pages/home/home_state.dart';
import 'package:newware_final_project/ui/pages/home/widgets/category_item.dart';
import 'package:newware_final_project/ui/pages/home/widgets/search_category.dart';
import 'package:newware_final_project/ui/widget/header_action/header_action.dart';
import 'package:newware_final_project/ui/widget/shimmer/app_shimmer.dart';

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
  return  const HomePageChildState();
  }
}

class HomePageChildState extends StatefulWidget {
  const HomePageChildState({super.key});

  @override
  State<HomePageChildState> createState() => _HomePageChildStateState();
}

class _HomePageChildStateState extends State<HomePageChildState> {
  late HomeCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<HomeCubit>(context);
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
            ? const AppShimmer()
            : Scaffold(
                body: SafeArea(
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 10,
                      right: 10,
                      left: 10,
                      bottom: 0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const HeaderAction(
                          pathIconLeft: AppImages.pathBackImage,
                        ),
                        AppStyles.sizedBoxStyle(
                          height: 25,
                        ),
                        SearchCategory(
                          searchFun: _cubit.searchCategory,
                        ),
                        AppStyles.sizedBoxStyle(
                          height: 25,
                        ),
                        Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent:
                                  MediaQuery.of(context).size.width / 2,
                              childAspectRatio: 3 / 3.45,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                            ),
                            itemCount: listCategoryLength,
                            itemBuilder: (BuildContext ctx, index) {
                              return GestureDetector(
                                onTap: () {
                                  _cubit.gotoProductListPage(
                                    categoryName:
                                        state.listFilterCategory[index].name!,
                                    categoryId:
                                        state.listFilterCategory[index].id!,
                                  );
                                },
                                child: CategoryItem(
                                  pathImage:
                                      state.listFilterCategory[index].image ??
                                          AppImages.pathErrorImage,
                                  name: state.listFilterCategory[index].name!,
                                  totalProduct: state
                                      .listFilterCategory[index].totalProduct!,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }

}
