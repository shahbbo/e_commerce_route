import 'package:e_commerce_route/core/widget/toasts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/widget/global_app_bar.dart';
import 'cubit/home_tab_states.dart';
import 'cubit/home_tab_cubit.dart';
import 'widgets/ads_widget.dart';
import 'widgets/custom_category_widget.dart';
import 'widgets/custom_section_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenCubit, HomeTabStates>(
      bloc: HomeScreenCubit.get(context)..getAllCategories()..getAllBrands(),
      listener: (context, state) {
        if (state is HomeCategoriesErrorState) {
          Toasts.error(context,state.failures.errorMessage);
        }
      },
      builder: (context, state) {
        final cubit = HomeScreenCubit.get(context);
        return Scaffold(
          appBar: const GlobalAppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                AdsWidget(),
                SizedBox(
                  height: 20.h,
                ),
                CustomSectionBar(
                    sectionNname: 'Categories',
                    function: () {}),
                state is HomeCategoriesLoadingState
                    ? Center(
                        child: CircularProgressIndicator(
                          color: ColorManager.primaryDark,
                        ),
                      )
                    : SizedBox(
                        height: 300.h,
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CustomCategoryOrBrandWidget(
                              categoryOrBrand: cubit.categoriesList[index],
                            );
                          },
                          itemCount: cubit.categoriesList.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                        ),
                      ),
                SizedBox(height: 12.h),
                CustomSectionBar(sectionNname: 'Brands', function: () {}),
                state is HomeBrandsLoadingState
                    ? Center(
                        child: CircularProgressIndicator(
                          color: ColorManager.primaryDark,
                        ),
                      )
                    : SizedBox(
                        height: 300.h,
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CustomCategoryOrBrandWidget(
                                categoryOrBrand: cubit.brandsList[index]);
                          },
                          itemCount:
                              HomeScreenCubit.get(context).brandsList.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
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
