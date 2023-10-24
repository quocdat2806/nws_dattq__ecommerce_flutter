import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newware_final_project/common/app_images_icons.dart';
import 'package:newware_final_project/common/app_styles.dart';
import 'package:newware_final_project/models/enums/load_status.dart';
import 'package:newware_final_project/repositories/product_responsitory.dart';
import 'package:newware_final_project/ui/pages/product_list/product_list_cubit.dart';
import 'package:newware_final_project/ui/pages/product_list/product_list_navigator.dart';
import 'package:newware_final_project/ui/pages/product_list/widgets/product_item.dart';
import 'package:newware_final_project/ui/widget/header_action/header_action.dart';
import 'package:newware_final_project/ui/widget/shimmer/app_shimmer.dart';

class ProductListPage extends StatefulWidget {
  static const router = 'productList';
  final int? categoryId;
  final String? categoryName;

  const ProductListPage({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: ProductListCubit(
        navigator: ProductListNavigator(context: context),
        proRepo: RepositoryProvider.of<ProductResponsitory>(context),
      ),
      child: ProductListChildPageState(
        categoryId: widget.categoryId!,
        categoryName: widget.categoryName!,
      ),
    );
  }
}

class ProductListChildPageState extends StatefulWidget {
  final String? categoryName;
  final int? categoryId;

  const ProductListChildPageState({
    super.key,
    this.categoryName,
    this.categoryId,
  });

  @override
  State<ProductListChildPageState> createState() =>
      _ProductListChildPageStateState();
}

class _ProductListChildPageStateState extends State<ProductListChildPageState> {
  late ProductListCubit _cubit;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    _cubit = BlocProvider.of<ProductListCubit>(context);
    _cubit.fetchProduct(widget.categoryId ?? 0);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _cubit.loadMore(widget.categoryId!);
    }
    if (_scrollController.position.pixels == 0 ) {
      _cubit.clearMore();
    }
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductListCubit, ProductListState>(
      bloc: _cubit,
      builder: (context, state) {
        return state.fetchProductStatus == LoadStatus.loading
            ? const AppShimmer()
            : Scaffold(
                body: SafeArea(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeaderAction(
                          onTabRightIcon: _cubit.openSearchPage,
                          onTabLeftIcon: _cubit.backPage,
                          pathIconLeft: AppImages.pathBackImage,
                          iconRight: AppStyles.iconSvgStyle(
                            pathImage: AppImages.pathSearchImage,
                          ),
                        ),
                        AppStyles.sizedBoxStyle(height: 20),
                        Text(
                          widget.categoryName!,
                          style: AppStyles.textStyle(
                            fontSize: 20,
                            fontFamily: 'ExtraBold',
                            fontWeight: FontWeight.w700,
                          ),
                          maxLines: 1,
                        ),
                        AppStyles.sizedBoxStyle(height: 15),
                        Expanded(
                          child: GridView.builder(
                            controller: _scrollController,
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent:
                                  MediaQuery.of(context).size.width / 2,
                              childAspectRatio: 3 / 5,
                              crossAxisSpacing: 25,
                              mainAxisSpacing: 25,
                            ),
                            itemCount: state.listFilterProduct.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return InkWell(
                                onTap: () {
                                  _cubit.openProductDetailPage(
                                    productId:
                                        state.listFilterProduct[index].id ?? 0,
                                  );
                                },
                                child: ProductItem(
                                  pathImage:
                                      state.listFilterProduct[index].images![0],
                                  title: state.listFilterProduct[index].title ??
                                      '',
                                  description: state
                                      .listFilterProduct[index].description!,
                                  price:
                                      state.listFilterProduct[index].price ?? 0,
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
