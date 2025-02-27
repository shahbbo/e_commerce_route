import 'package:e_commerce_route/features/wishlist_screen/presentation/cubit/wish_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/values_manager.dart';
import '../../../../../../core/widget/global_app_bar.dart';
import '../../../core/resources/color_manager.dart';
import '../../products_screen/presentation/cubit/product_screen_states.dart';
import 'widgets/wishlist_item.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishListScreenCubit, WishListState>(
      bloc: WishListScreenCubit.get(context)..getWishList(),
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = WishListScreenCubit.get(context);
        return Scaffold(
          appBar: const GlobalAppBar(),
          body: state is WishListLoadingState
              ? Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.primaryDark,
                  ),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSize.s14.w, vertical: AppSize.s10.h),
                  child:
                  cubit.wishList.isEmpty
                      ? Center(
                          child: Text(
                            'No items in your wish list',
                            style: TextStyle(
                                color: ColorManager.primaryDark,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      :
                  ListView.builder(
                    itemCount: cubit.wishList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: AppSize.s12.h),
                        child: WishListItem(product: cubit.wishList[index]),
                      );
                    },
                  )),
        );
      },
    );
  }
}
