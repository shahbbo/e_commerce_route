import 'package:e_commerce_route/core/widget/loading_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/values_manager.dart';
import '../../../core/widget/global_app_bar.dart';
import '../../product_details/presentation/product_details.dart';
import 'cubit/product_screen_states.dart';
import 'cubit/product_screen_cubit.dart';
import 'widgets/custom_product_widget.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductScreenCubit, ProductScreenStates>(
      bloc: ProductScreenCubit.get(context)..getAllProducts()..getWishList(),
      builder: (context, state) {
        return LoadingOverlay(
          isLoading: state is ProductsLoadingState || state is AddToCartLoadingState || state is WishListLoadingState,
          child: Scaffold(
            appBar: GlobalAppBar(),
            body: state is ProductsLoadingState
                ? Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.primaryDark,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(AppPadding.p16),
                    child: Column(
                      children: [
                        Expanded(
                          child: GridView.builder(
                            itemCount: ProductScreenCubit.get(context)
                                .productsList!
                                .length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              childAspectRatio: 7 / 9,
                            ),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ProductDetails(
                                        productId: ProductScreenCubit.get(context)
                                            .productsList![index].id ?? '',
                                          )));
                                },
                                child: ProductItemWidget(
                                    productEntity:
                                        ProductScreenCubit.get(context)
                                            .productsList![index]),
                              );
                            },
                            scrollDirection: Axis.vertical,
                          ),
                        )
                      ],
                    ),
                  ),
          ),
        );
        // if (state is ProductLoadingState) {
        //   return Center(
        //     child: CircularProgressIndicator(
        //       color: ColorManager.primaryDark,
        //     ),
        //   );
        // } else {
        //   return Scaffold(
        //     appBar: AppBar(
        //       backgroundColor: Colors.transparent,
        //       elevation: 0,
        //       surfaceTintColor: Colors.white,
        //       title: SvgPicture.asset(
        //         SvgAssets.routeLogo,
        //         height: 25.h,
        //         width: 25.w,
        //         colorFilter: const ColorFilter.mode(
        //             ColorManager.textColor, BlendMode.srcIn),
        //       ),
        //       bottom: PreferredSize(
        //           preferredSize: const Size(AppSize.s100, AppSize.s60),
        //           child: Padding(
        //             padding: const EdgeInsets.all(AppPadding.p8),
        //             child: Row(
        //               children: [
        //                 Expanded(
        //                   child: TextFormField(
        //                     cursorColor: ColorManager.primary,
        //                     style: getRegularStyle(
        //                         color: ColorManager.primary,
        //                         fontSize: FontSize.s16),
        //                     decoration: InputDecoration(
        //                       contentPadding: EdgeInsets.symmetric(
        //                           horizontal: AppMargin.m12.w,
        //                           vertical: AppMargin.m8.h),
        //                       focusedErrorBorder: OutlineInputBorder(
        //                           borderRadius: BorderRadius.circular(10000),
        //                           borderSide: BorderSide(
        //                               width: AppSize.s1,
        //                               color: ColorManager.primary)),
        //                       enabledBorder: OutlineInputBorder(
        //                           borderRadius: BorderRadius.circular(10000),
        //                           borderSide: BorderSide(
        //                               width: AppSize.s1,
        //                               color: ColorManager.primary)),
        //                       disabledBorder: OutlineInputBorder(
        //                           borderRadius: BorderRadius.circular(10000),
        //                           borderSide: BorderSide(
        //                               width: AppSize.s1,
        //                               color: ColorManager.primary)),
        //                       focusedBorder: OutlineInputBorder(
        //                           borderRadius: BorderRadius.circular(10000),
        //                           borderSide: BorderSide(
        //                               width: AppSize.s1,
        //                               color: ColorManager.primary)),
        //                       errorBorder: OutlineInputBorder(
        //                           borderRadius: BorderRadius.circular(10000),
        //                           borderSide: BorderSide(
        //                               width: AppSize.s1,
        //                               color: ColorManager.error)),
        //                       prefixIcon: ImageIcon(
        //                         AssetImage(IconsAssets.icSearch),
        //                         color: ColorManager.primary,
        //                       ),
        //                       hintText: "what do you search for?",
        //                       hintStyle: getRegularStyle(
        //                           color: ColorManager.primary,
        //                           fontSize: FontSize.s16),
        //                     ),
        //                   ),
        //                 ),
        //                 IconButton(
        //                     onPressed: () =>
        //                         Navigator.pushNamed(context, Routes.cartRoute),
        //                     icon: ImageIcon(
        //                       AssetImage(IconsAssets.icCart),
        //                       color: ColorManager.primary,
        //                     ))
        //               ],
        //             ),
        //           )),
        //       // leading: const SizedBox.shrink(),
        //     ),
        //     body: Padding(
        //       padding: const EdgeInsets.all(AppPadding.p16),
        //       child: Column(
        //         children: [
        //           Expanded(
        //             child: GridView.builder(
        //               itemCount: ProductScreenViewModel.get(context)
        //                   .productsList!
        //                   .length,
        //               gridDelegate:
        //                   const SliverGridDelegateWithFixedCrossAxisCount(
        //                 crossAxisCount: 2,
        //                 crossAxisSpacing: 8,
        //                 mainAxisSpacing: 8,
        //                 childAspectRatio: 7 / 9,
        //               ),
        //               itemBuilder: (context, index) {
        //                 return InkWell(
        //                   onTap: () {
        //                     if (ProductScreenViewModel.get(context)
        //                             .productsList?[index] !=
        //                         null) {
        //                       Navigator.of(context).pushNamed(
        //                           Routes.productDetails,
        //                           arguments: ProductScreenViewModel.get(context)
        //                               .productsList?[index]);
        //                     }
        //                   },
        //                   child: ProductItemWidget(
        //                       productEntity: ProductScreenViewModel.get(context)
        //                           .productsList![index]),
        //                 );
        //               },
        //               scrollDirection: Axis.vertical,
        //             ),
        //           )
        //         ],
        //       ),
        //     ),
        //   );
        // }
      },
    );
  }
}
