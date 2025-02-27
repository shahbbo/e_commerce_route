import 'package:e_commerce_route/core/widget/toasts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../cubit/wish_list_cubit.dart';
import '../../../../core/resources/color_manager.dart';

class HeartButton extends StatelessWidget {

  final String id;

  const HeartButton({super.key, required this.id,});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishListScreenCubit, WishListState>(
      listener: (context, state) {
        if (state is AddRemoveWishListSuccessState) {
          Toasts.success(context, state.addToWishListResponseEntity.message!);
        } else if (state is AddRemoveWishListErrorState) {
          Toasts.error(context, state.failures.errorMessage);
        }
      },
      builder: (context, state) {
        final cubit = WishListScreenCubit.get(context);
        return InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          onTap: () {
            cubit.removeFromWishList(id);
          },
          child: Material(
            color: ColorManager.white,
            elevation: 5,
            shape: const StadiumBorder(),
            shadowColor: ColorManager.black,
            child: Padding(
                padding: const EdgeInsets.all(2),
                child: Icon(
                  Icons.favorite,
                  color: ColorManager.primary,
                  size: 28.sp,
                )),
          ),
        );
      },
    );
  }
}
