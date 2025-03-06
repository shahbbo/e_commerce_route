import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../cubit/wish_list_state.dart';
import 'heart_button.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../product_details/presentation/product_details.dart';
import '../../domain/entities/wish_list_entity.dart';
import '../cubit/wish_list_cubit.dart';
import 'add_to_cart_button.dart';
import 'custom_txt_widget.dart';

class WishListItem extends StatelessWidget {
  const WishListItem({super.key, required this.product});
  final DataEntity product;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishListScreenCubit, WishListState>(
  listener: (context, state) {},
  builder: (context, state) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetails(
              productId: product.id ?? '',
            )));
      },
      child: Container(
        height: AppSize.s135.h,
        padding: EdgeInsets.only(right: AppSize.s8.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s16.r),
            border: Border.all(color: ColorManager.primary.withAlpha(70))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s16.r),
                  border:
                      Border.all(color: ColorManager.primary.withAlpha(200))),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.s16.r),
                child: CachedNetworkImage(
                  width: AppSize.s120.w,
                  height: AppSize.s135.h,
                  fit: BoxFit.cover,
                  imageUrl: product.imageCover ?? '',
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.primary,
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(
                    Icons.error,
                    color: ColorManager.primary,
                  ),
                ),
              ),
            ),
            Expanded(
                child: Padding(
                    padding: EdgeInsets.only(left: AppSize.s8.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomText(
                          data: product.title ?? '',
                          textStyle: getSemiBoldStyle(
                              color: ColorManager.primaryDark, fontSize: AppSize.s18.sp),
                        ),
                        Row(
                          children: [
                            CustomText(
                              data: 'EGP ${product.price}  ',
                              textStyle: getSemiBoldStyle(
                                  color: ColorManager.primaryDark, fontSize: AppSize.s18.sp)
                                  .copyWith(
                                letterSpacing: 0.17,
                              ),
                            ),
                            product.price == null
                                ? Container()
                                : Flexible(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: AppSize.s10.h,
                                  ),
                                  CustomText(
                                      data: 'EGP ${product.price! * 1.3}',
                                      textStyle: getMediumStyle(
                                          color: ColorManager.appBarTitleColor
                                              .withAlpha(200))
                                          .copyWith(
                                          letterSpacing: 0.17,
                                          decoration: TextDecoration.lineThrough,
                                          color: ColorManager.appBarTitleColor
                                              .withAlpha(200),
                                          fontSize: AppSize.s10.sp)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ))),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                HeartButton(
                  id: product.id ?? '',
                ),
                SizedBox(height: AppSize.s8.h),
                AddToCartButton(
                  id: product.id ?? '',
                )
              ],
            )
          ],
        ),
      ),
    );
  },
);
  }
}
