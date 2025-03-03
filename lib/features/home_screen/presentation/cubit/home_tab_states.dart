
import '../../domain/entities/category_or_brand_entity.dart';
import '../../../../core/helpers/remote/failures.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_tab_states.freezed.dart';

@freezed
class HomeScreenStates with _$HomeScreenStates {
  const factory HomeScreenStates.initial() = HomeTabInitialState;

  const factory HomeScreenStates.getCategoriesLoading() = HomeCategoriesLoadingState;

  const factory HomeScreenStates.getCategoriesError({required Failures failures}) = HomeCategoriesErrorState;

  const factory HomeScreenStates.getCategoriesSuccess({required CategoryOrBrandResponseEntity categoryResponseEntity}) = HomeCategoriesSuccessState;

  const factory HomeScreenStates.getBrandsLoading() = HomeBrandsLoadingState;

  const factory HomeScreenStates.getBrandsError({required Failures failures}) = HomeBrandsErrorState;

  const factory HomeScreenStates.getBrandsSuccess({required CategoryOrBrandResponseEntity brandsResponseEntity}) = HomeBrandsSuccessState;

}


// abstract class HomeTabStates{}
// class HomeTabInitialState extends HomeTabStates{}
// class HomeCategoriesLoadingState extends HomeTabStates{}
// class HomeCategoriesErrorState extends HomeTabStates{
//   Failures failures ;
//   HomeCategoriesErrorState({required this.failures});
// }
// class HomeCategoriesSuccessState extends HomeTabStates{
//   CategoryOrBrandResponseEntity categoryResponseEntity ;
//   HomeCategoriesSuccessState({required this.categoryResponseEntity});
// }
//
// class HomeBrandsLoadingState extends HomeTabStates{}
// class HomeBrandsErrorState extends HomeTabStates{
//   Failures failures ;
//   HomeBrandsErrorState({required this.failures});
// }
// class HomeBrandsSuccessState extends HomeTabStates{
//   CategoryOrBrandResponseEntity brandsResponseEntity ;
//   HomeBrandsSuccessState({required this.brandsResponseEntity});
// }
