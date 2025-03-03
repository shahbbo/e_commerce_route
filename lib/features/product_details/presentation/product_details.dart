import 'package:e_commerce_route/core/widget/toasts.dart';
import 'package:e_commerce_route/features/products_screen/presentation/cubit/product_screen_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/styles_manager.dart';
import '../../../core/widget/custom_button.dart';
import '../domain/entities/product_details_entity.dart';
import 'cubit/product_details_cubit.dart';
import 'cubit/product_details_state.dart';
import 'widgets/image_slider.dart';
import 'widgets/product_description.dart';
import 'widgets/product_label.dart';
import 'widgets/product_rating.dart';

class ProductDetails extends StatelessWidget {
  final String productId;

  const ProductDetails({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
      bloc: ProductDetailsCubit.get(context)..getProductDetails(productId),
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = ProductDetailsCubit.get(context);
        final product = cubit.productDetails.data ?? Data();
        return Scaffold(
          appBar: AppBar(
            forceMaterialTransparency: true,
            elevation: 0,
            iconTheme: IconThemeData(color: ColorManager.primary),
            centerTitle: true,
            title: Text(
              'Product Details',
              style: getMediumStyle(color: ColorManager.appBarTitleColor)
                  .copyWith(fontSize: 20.sp),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.search,
                    color: ColorManager.primary,
                    size: 35.sp,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: ColorManager.primary,
                    size: 35.sp,
                  )),
            ],
          ),
          body: state.status == ProductDetailsStateEnum.loading
              ? Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.primary,
                  ),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 16.w, right: 16.w, bottom: 50.h),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ImageSlider(images: product.images!),
                          SizedBox(
                            height: 25.h,
                          ),
                          ProductLabel(
                              productName: product.title ?? '',
                              productPrice: 'EGP ${product.price}'),
                          SizedBox(
                            height: 15.h,
                          ),
                          ProductRating(
                              productBuyers: '${product.sold}',
                              productRating: '${product.ratingsAverage}'),
                          SizedBox(
                            height: 15.h,
                          ),
                          ProductDescription(
                              productDescription: product.description ?? ''),
                          SizedBox(
                            height: 30.h,
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Total price',
                                    style: getMediumStyle(
                                            color: ColorManager.primary
                                                .withOpacity(.6))
                                        .copyWith(fontSize: 18.sp),
                                  ),
                                  SizedBox(
                                    height: 12.h,
                                  ),
                                  Text('EGP ${product.price}',
                                      style: getMediumStyle(
                                              color:
                                                  ColorManager.appBarTitleColor)
                                          .copyWith(fontSize: 18.sp))
                                ],
                              ),
                              SizedBox(
                                width: 33.w,
                              ),
                              Expanded(
                                child: CustomButton(
                                  label: 'Add to cart',
                                  onTap: () {
                                    ProductScreenCubit.get(context).addToCart(productId);
                                    Toasts.success(context, 'Product added to cart');
                                  },
                                  prefixIcon: Icon(
                                    Icons.add_shopping_cart_outlined,
                                    color: ColorManager.white,
                                  ),
                                ),
                              )
                            ],
                          )
                        ]),
                  ),
                ),
        );
      },
    );
  }
}
