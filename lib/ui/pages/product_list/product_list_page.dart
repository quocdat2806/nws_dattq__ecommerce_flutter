import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newware_final_project/common/app_images_icons.dart';
import 'package:newware_final_project/common/app_styles.dart';
import 'package:newware_final_project/models/entities/product/product_entity.dart';
import 'package:newware_final_project/models/enums/load_status.dart';
import 'package:newware_final_project/responsitories/product_responsitory.dart';
import 'package:newware_final_project/ui/pages/product_list/product_list_cubit.dart';
import 'package:newware_final_project/ui/pages/product_list/product_list_navigator.dart';
import 'package:newware_final_project/ui/pages/product_list/widgets/product_item.dart';
import 'package:newware_final_project/ui/widget/header_action/header_action.dart';
import 'package:newware_final_project/ui/widget/shimmer/app_grid_shimmer_loading.dart';

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
        categoryId: widget.categoryId ?? 0,
        categoryName: widget.categoryName ?? '',
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
    if (_scrollController.position.pixels == 0) {
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
            ? const Scaffold(
          body: SafeArea(
            child: AppGridShimmerLoading(),
          ),
        )
            : Scaffold(
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(
                bottom: 0,
                top: 20,
                right: 20,
                left: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  HeaderAction(
                    onTabRightIcon: _cubit.openSearchPage,
                    onTabLeftIcon: _cubit.backPage,
                    pathIconLeft: AppImages.pathBackImage,
                    iconRight: AppStyles.iconSvgStyle(
                      pathImage: AppImages.pathSearchImage,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    widget.categoryName ?? '',
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
                      padding: const EdgeInsets.only(bottom: 24),
                      controller: _scrollController,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3 / 5,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: state.listFilterProduct.length,
                      itemBuilder: (BuildContext ctx, index) {
                        ProductEntity productEntity = state
                            .listFilterProduct[index];
                        return ProductItem(
                          onTabProductItem: _cubit.openProductDetailPage,
                          productEntity: productEntity,
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
