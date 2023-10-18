// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newware_final_project/common/app_colors.dart';
import 'package:newware_final_project/common/app_styles.dart';
import 'package:newware_final_project/models/enums/load_status.dart';
import 'package:newware_final_project/repositories/product_responsitory.dart';
import 'package:newware_final_project/repositories/user_responsitory.dart';
import 'package:newware_final_project/ui/commons/show_error.dart';
import 'package:newware_final_project/ui/commons/show_success.dart';
import 'package:newware_final_project/ui/pages/product_detail/product_detail_cubit.dart';
import 'package:newware_final_project/ui/pages/product_detail/product_detail_navigator.dart';
import 'package:newware_final_project/ui/pages/product_detail/widgets/add_to_cart_product_detail.dart';
import 'package:newware_final_project/ui/pages/product_detail/widgets/description_product_detail.dart';
import 'package:newware_final_project/ui/pages/product_detail/widgets/info_product_detail.dart';
import 'package:newware_final_project/ui/pages/product_detail/widgets/size_color_product_detail.dart';
import 'package:newware_final_project/ui/pages/product_detail/widgets/slider_image_product_detail.dart';
import 'package:newware_final_project/ui/widget/loading/loading_status.dart';
import 'package:quickalert/quickalert.dart';

class ProductDetailPage extends StatefulWidget {
  static const router = 'productDetail';
  final int? productId;
  const ProductDetailPage({super.key, required this.productId});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (con) {
        final proRepo = RepositoryProvider.of<ProductResponsitory>(context);
        final userRepo = RepositoryProvider.of<UserResponsitory>(context);
        return ProductDetailCubit(
          navigator: ProductDetailNavigator(context: context),
          proRepo: proRepo,
          userRepo: userRepo,
        );
      },
      child: ProductPageChildState(productId: widget.productId!),
    );
  }
}

class ProductPageChildState extends StatefulWidget {
  final int? productId;

  const ProductPageChildState({super.key, this.productId});

  @override
  State<ProductPageChildState> createState() => _ProductPageChildStateState();
}

class _ProductPageChildStateState extends State<ProductPageChildState> {
  late ProductDetailCubit _cubit;
  late final _listSize;
  late final _listColor;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<ProductDetailCubit>(context);
    _cubit.fetchData(widget.productId!);
    _listSize = ['S', 'M', 'L', 'XL', 'XXL'];
    _listColor = [
      'c1',
      'c2',
      'c3',
      'c4',
    ];
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailCubit, ProductDetailState>(
      bloc: _cubit,
      builder: (context, state) {
        if (state.loadAddtoCartStatus == LoadStatus.successAddToCart) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            SuccessAlert().showSuccessAlert(context,'Bạn đã đặt hàng thành công');
          });
        }
        if (state.loadAddtoCartStatus == LoadStatus.failure) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ErrorAlert().showError(context);

          });
        }
        return state.loadAddtoCartStatus == LoadStatus.loading ||
            state.loadProductDetalStatus == LoadStatus.loading
            ? const LoadingStatus()
            : Scaffold(
          body: SafeArea(
            child: SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Stack(
                children: [
                  SliderImageProductDetail(
                    state: state,
                    cubit: _cubit,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    top: MediaQuery
                        .of(context)
                        .size
                        .height / 2.2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      decoration: const BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          topLeft: Radius.circular(25),
                        ),
                      ),
                      child: ListView(
                        children: [
                          InfoProductDetail(state: state, cubit: _cubit),
                          AppStyles.sizedBoxStyle(),
                          SizeColorProductDetail(
                            cubit: _cubit,
                            state: state,
                            listSize: _listSize,
                            listColor: _listColor,
                          ),
                          DescriptionProductDetail(
                            description:
                            state.productEntity?.description ?? '',
                          ),
                          AppStyles.sizedBoxStyle(height: 15),
                          AddToCartProductDetail(
                            state: state,
                            cubit: _cubit,
                            listSize: _listSize,
                            listColor: _listColor,
                          ),
                        ],
                      ),
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


