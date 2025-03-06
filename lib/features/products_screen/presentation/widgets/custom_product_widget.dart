import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_route/core/widget/toasts.dart';
import 'package:e_commerce_route/features/products_screen/presentation/cubit/product_screen_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../domain/entities/product_entity.dart';
import '../cubit/product_screen_cubit.dart';

class ProductItemWidget extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductItemWidget({super.key, required this.productEntity});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductScreenCubit, ProductScreenStates>(
      listener: (context, state) {
        if (state.status == ProductScreenStatus.addToCartError) {
          Toasts.success(
            context, state.addToCartEntity!.message ?? 'Added to cart',
          );
        } else if (state.status == ProductScreenStatus.wishListError) {
          Toasts.error(context, state.failures!.errorMessage);
        }
      },
      builder: (context, state) {
        final cubit = ProductScreenCubit.get(context);
        return Container(
          width: 191.w,
          height: 237.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(
              color: ColorManager.primaryDark,
              width: 1.w,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: CachedNetworkImage(
                      imageUrl: productEntity.imageCover ?? '',
                      height: 128.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(
                        color: ColorManager.primaryDark,
                      )),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  Positioned(
                    top: 5.h,
                    right: 2.w,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 15,
                      child: IconButton(
                        color: ColorManager.primaryDark,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          var isInWishlist = cubit.isProductInWishList(productEntity.id ?? '');
                          if (isInWishlist) {
                            cubit.removeFromWishList(productEntity.id ?? '');
                            isInWishlist = false;
                          } else {
                            cubit.addToWishList(productEntity.id ?? '');
                            isInWishlist = true;
                          }
                        },
                        icon: cubit.isProductInWishList(productEntity.id ?? '')
                            ? const Icon(Icons.favorite_rounded)
                            : const Icon(Icons.favorite_border_rounded),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 7.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: Text(
                  productEntity.title ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 14.sp,
                        color: ColorManager.primaryDark,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              SizedBox(
                height: 7.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: Row(
                  children: [
                    Text(
                      'EGP ${productEntity.price}',
                      maxLines: 1,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 14.sp,
                            color: ColorManager.primaryDark,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 7.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0.w, right: 8.w),
                child: Row(
                  children: [
                    Text(
                      '  (${productEntity.ratingsAverage})',
                      maxLines: 1,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 14.sp,
                            color: ColorManager.primaryDark,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    SizedBox(
                      width: 7.w,
                    ),
                    const Icon(
                      Icons.star_rate_rounded,
                      color: ColorManager.starRateColor,
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        ProductScreenCubit.get(context)
                            .addToCart(productEntity.id ?? '');
                      },
                      splashColor: Colors.transparent,
                      child: Icon(
                        Icons.add_circle,
                        size: 32.sp,
                        color: ColorManager.primaryDark,
                      ),
                    )
                  ],
                ),
              )
              // GridViewCardItemBody(
              //   productEntity: productEntity,
              // )
            ],
          ),
        );
      },
    );
  }
}
