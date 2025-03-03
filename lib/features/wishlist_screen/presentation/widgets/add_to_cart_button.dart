import 'package:e_commerce_route/features/products_screen/presentation/cubit/product_screen_cubit.dart';
import 'package:e_commerce_route/features/products_screen/presentation/cubit/product_screen_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/styles_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../core/widget/toasts.dart';

class AddToCartButton extends StatelessWidget {

  final String id;

  const AddToCartButton({super.key, required this.id});


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductScreenCubit, ProductScreenStates>(
      listener: (context, state) {
        if (state is AddToCartSuccessState) {
          Toasts.success(
            context, state.addToCartEntity.message ?? '',
          );
        } else if (state is AddToCartErrorState) {
          Toasts.error(context, state.failures.errorMessage);
        }
      },
      builder: (context, state) {
        final cubit = ProductScreenCubit.get(context);
        return SizedBox(
          width: 100.w,
          height: 36.h,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSize.s14.r)),
                  padding: EdgeInsets.symmetric(horizontal: AppSize.s1.w),
                  backgroundColor: ColorManager.primary),
              onPressed: () {
                cubit.addToCart(id);
              },
              child: Text("Add to Cart",
                  style: getRegularStyle(
                    color: ColorManager.white,
                    fontSize: AppSize.s14.sp,
                  ))),
        );
      },
    );
  }
}
