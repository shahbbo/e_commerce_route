import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../domain/entities/category_or_brand_entity.dart';
import '../../domain/use_case/get_all_brands_use_case.dart';
import '../../domain/use_case/get_all_categories_use_case.dart';
import 'home_tab_states.dart';

@injectable
class HomeScreenCubit extends Cubit<HomeTabState> {
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetAllBrandsUseCase getAllBrandsUseCase ;

  HomeScreenCubit({required this.getAllCategoriesUseCase,
  required this.getAllBrandsUseCase})
      : super(HomeTabState.initial());

  List<CategoryOrBrandEntity> categoriesList = [];
  List<CategoryOrBrandEntity> brandsList = [];
  List<String> sliderImages = [
    PngAssets.carouselSlider1,
    PngAssets.carouselSlider2,
    PngAssets.carouselSlider3
  ];

  static HomeScreenCubit get(context)=> BlocProvider.of(context);


  void getAllCategoriesAndBrands() async {
    emit(state.copyWith(status: HomeTabStatus.loading));
    var either = await getAllCategoriesUseCase.invoke();
    either.fold((error) {
      emit(state.copyWith(status: HomeTabStatus.getCategoriesError, failures: error));
    }, (response) {
      categoriesList = response.data!;
      if(brandsList.isNotEmpty) {
        emit(state.copyWith(status: HomeTabStatus.getCategoriesSuccess, categoryResponseEntity: response));
      }
    });
    var either2 = await getAllBrandsUseCase.invoke();
    either2.fold((error) {
      emit(state.copyWith(status: HomeTabStatus.getBrandsError, failures: error));
    }, (response) {
      brandsList = response.data!;
      if(categoriesList.isNotEmpty) {
        emit(state.copyWith(status: HomeTabStatus.getBrandsSuccess, brandsResponseEntity: response));
      }
    });
  }



 /* void getAllCategories() async {
    emit(HomeScreenStates.getCategoriesLoading());
    var either = await getAllCategoriesUseCase.invoke();
    either.fold((l) {
      emit(HomeScreenStates.getCategoriesError(failures: l));
    }, (response) {
      categoriesList = response.data!;
      if(brandsList.isNotEmpty) {
        emit(HomeScreenStates.getCategoriesSuccess(categoryResponseEntity: response));
      }
    });
  }

  void getAllBrands() async {
    emit(HomeScreenStates.getBrandsLoading());
    var either = await getAllBrandsUseCase.invoke();
    either.fold((l) {
      emit(HomeScreenStates.getBrandsError(failures: l));
    }, (response) {
      brandsList = response.data!;
      if(categoriesList.isNotEmpty) {
        emit(HomeScreenStates.getBrandsSuccess(brandsResponseEntity: response));
      }
    }
    );
  }
*/
  // void getAllCategories() async {
  //   emit(HomeCategoriesLoadingState());
  //   var either = await getAllCategoriesUseCase.invoke();
  //   either.fold((error) {
  //     emit(HomeCategoriesErrorState(failures: error));
  //   }, (response) {
  //       categoriesList = response.data!;
  //       if(brandsList.isNotEmpty) {
  //         emit(HomeCategoriesSuccessState(categoryResponseEntity: response));
  //       }
  //   });
  // }
  //
  // void getAllBrands() async {
  //   emit(HomeBrandsLoadingState());
  //   var either = await getAllBrandsUseCase.invoke();
  //   either.fold((error) {
  //     emit(HomeBrandsErrorState(failures: error));
  //   }, (response) {
  //     brandsList = response.data!;
  //     if(categoriesList.isNotEmpty) {
  //       emit(HomeBrandsSuccessState(brandsResponseEntity: response));
  //     }
  //   }
  //   );
  // }
}
