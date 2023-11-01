// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newware_final_project/bloc/app_cubit.dart';
import 'package:newware_final_project/common/app_colors.dart';
import 'package:newware_final_project/common/app_styles.dart';
import 'package:newware_final_project/models/enums/load_status.dart';
import 'package:newware_final_project/responsitories/product_responsitory.dart';
import 'package:newware_final_project/responsitories/user_responsitory.dart';
import 'package:newware_final_project/ui/pages/product_detail/product_detail_cubit.dart';
import 'package:newware_final_project/ui/pages/product_detail/product_detail_navigator.dart';
import 'package:newware_final_project/ui/pages/product_detail/widgets/add_to_cart.dart';
import 'package:newware_final_project/ui/pages/product_detail/widgets/description.dart';
import 'package:newware_final_project/ui/pages/product_detail/widgets/infomation.dart';
import 'package:newware_final_project/ui/pages/product_detail/widgets/size_color.dart';
import 'package:newware_final_project/ui/pages/product_detail/widgets/slider_image.dart';
import 'package:newware_final_project/ui/widget/loading/circular_loading.dart';

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
    final userRepo = RepositoryProvider.of<UserResponsitory>(context);
    return BlocProvider(
      create: (con) {
        final proRepo = RepositoryProvider.of<ProductResponsitory>(context);
        return ProductDetailCubit(
          navigator: ProductDetailNavigator(context: context),
          proRepo: proRepo,
          userRepo: userRepo,
        );
      },
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return ProductPageChildState(
            productId: widget.productId ?? 0,
          );
        },
      ),
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

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<ProductDetailCubit>(context);
    _cubit.fetchProductDetail(widget.productId ?? 0);
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
        _cubit.showSuccessAddToCart(context);
        return state.loadProductDetalStatus == LoadStatus.loading
            ? const CircularLoading()
            : Scaffold(
                body: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      SlideImageProduct(
                        currentImage: state.currentImage,
                        onTabBackIcon: _cubit.backPage,
                        onTabCartIcon: _cubit.openCartPage,
                        onChangeImage: _cubit.handleChangImage,
                        images: state.productEntity?.images ?? [],
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        top: MediaQuery.of(context).size.height / 2.2,
                        child: Container(
                          padding: const EdgeInsets.only(
                            bottom: 0,
                            left: 15,
                            right: 15,
                            top: 15,
                          ),
                          decoration: const BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              topLeft: Radius.circular(25),
                            ),
                          ),
                          child: ListView(
                            padding: const EdgeInsets.only(bottom: 0),
                            children: [
                              InformationProduct(
                                quantity: state.quantity,
                                title: state.productEntity?.title,
                                description: state.productEntity?.description,
                                handleDecreseQuantity: () {
                                  int? price = state.productEntity?.price;
                                  _cubit.handleDecresementCouting(
                                    price: price,
                                  );
                                },
                                handleIncreseQuantity: () {
                                  int? price = state.productEntity?.price;
                                  _cubit.handleIncresementCouting(
                                    price: price,
                                  );
                                },
                              ),
                              AppStyles.sizedBoxStyle(),
                              SizeAndColorProduct(
                                handleChangeColor: _cubit.handleChangeColor,
                                handleChangeSize: _cubit.handleChangeSize,
                                currentColor: state.currentColor,
                                currentSize: state.currentSize,
                              ),
                              DescriptionProduct(
                                description:
                                    state.productEntity?.description ?? '',
                              ),
                              AppStyles.sizedBoxStyle(height: 24),
                              BlocBuilder<AppCubit, AppState>(
                                builder: (context, stateUser) {
                                  return AddToCart(
                                    totalPrice: state.totalPrice,
                                    handleAddToCart: () {
                                      _cubit.handleAddToCart(
                                        userEntity: stateUser.user,
                                        productEntity: state.productEntity,
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
