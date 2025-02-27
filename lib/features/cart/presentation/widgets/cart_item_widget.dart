import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widget/product_counter.dart';
import '../../domain/entities/get_cart_entity.dart';
import '../cubit/cart_screen_cubit.dart';

class CartItemWidget extends StatelessWidget {
  final GetProductCartEntity productEntity;

  const CartItemWidget({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    final cubit = CartScreenCubit.get(context);
    return Container(
      width: 398.w,
      height: 140.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: ColorManager.primary),
      ),
      child: Row(children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(color: ColorManager.primary, width: 1),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14.r),
            child: CachedNetworkImage(
              width: 130.w,
              height: 145.h,
              fit: BoxFit.fill,
              imageUrl: productEntity.product?.imageCover ?? '',
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(
                  color: ColorManager.primaryDark,
                ),
              ),
              errorWidget: (context, url, error) => Icon(
                Icons.error,
                color: ColorManager.primaryDark,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppPadding.p8.w,
              vertical: AppPadding.p8.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        productEntity.product?.title ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: getBoldStyle(
                          color: ColorManager.textColor,
                          fontSize: AppSize.s18.sp,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        cubit.deleteItemInCart(productEntity.product?.id ?? '');
                      },
                      child: Icon(
                        CupertinoIcons.delete,
                        color: ColorManager.primary,
                      ),
                    )
                  ],
                ),
                const Spacer(flex: 3,),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'EGP ${productEntity.price}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: getBoldStyle(
                            color: ColorManager.textColor,
                            fontSize: AppSize.s18.sp),
                      ),
                    ),
                    ProductCounter(
                      add: (i) {
                        int count = productEntity.count!.toInt();
                        count++;
                        cubit.updateCountInCart(
                            productEntity.product?.id ?? "", count);
                      },
                      remove: (i) {
                        int count = productEntity.count!.toInt();
                        count--;
                        cubit.updateCountInCart(
                            productEntity.product?.id ?? "", count);
                      },
                      productCounter: productEntity.count!.toInt(),
                    )
                  ],
                ),
                const Spacer(flex: 1,),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
