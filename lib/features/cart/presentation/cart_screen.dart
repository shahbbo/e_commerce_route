import 'package:e_commerce_route/core/widget/toasts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/styles_manager.dart';
import '../../../core/resources/values_manager.dart';
import '../../../core/widget/loading_overlay.dart';
import 'cubit/cart_screen_cubit.dart';
import 'cubit/cart_states.dart';
import 'widgets/cart_item_widget.dart';
import 'widgets/total_price_and_checkout.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartScreenCubit, CartState>(
      bloc: CartScreenCubit.get(context)..getCart(),
      listener: (context, state) {
        if (state.status == CartStatus.getCartError) {
          Toasts.success(context, 'Error while getting cart');
        } else if (state.status == CartStatus.deleteItemInCartError) {
          Toasts.error(context,state.failures!.errorMessage);
        } else if (state.status == CartStatus.updateCountInCartSuccess) {
          Toasts.success(context, 'Item count updated successfully');
        } else if (state.status == CartStatus.updateCountInCartError) {
          Toasts.error(context,state.failures!.errorMessage);
        }
      },
      builder: (context, state) {
        final cubit = CartScreenCubit.get(context);
        return LoadingOverlay(
          isLoading: state.status == CartStatus.getCartLoading ||
              state.status == CartStatus.deleteItemInCartLoading ||
              state.status == CartStatus.updateCountInCartLoading,
          child: Scaffold(
            appBar: AppBar(
              forceMaterialTransparency: true,
              elevation: 0,
              centerTitle: true,
              iconTheme: IconThemeData(color: ColorManager.primaryDark),
              title: Text(
                'Cart',
                style:
                    getMediumStyle(fontSize: 20, color: ColorManager.textColor),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.search,
                    size: 33.sp,
                    color: ColorManager.primary,
                  ),
                ),
                SizedBox(width: AppSize.s14.w),
              ],
            ),
            body: cubit.cartResponse.data != null
                ? Padding(
                    padding: const EdgeInsets.all(AppPadding.p14),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            itemBuilder: (context, index) => CartItemWidget(
                              productEntity: cubit.cartResponse.data!.products![index],
                            ),
                            separatorBuilder: (context, index) =>
                                SizedBox(height: AppSize.s14.h),
                            itemCount:
                                cubit.cartResponse.data!.products!.length,
                          ),
                        ),
                        TotalPriceAndCheckout(
                          totalPrice: cubit.cartResponse.data!.totalCartPrice!.toInt(),
                          checkoutButtonOnTap: () {},
                        ),
                        SizedBox(height: 10.h),
                      ],
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(
                    color: ColorManager.primary,
                  )),
          ),
        );
      },
    );
  }
}
