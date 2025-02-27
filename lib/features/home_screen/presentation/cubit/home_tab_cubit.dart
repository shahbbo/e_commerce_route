import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../domain/entities/category_or_brand_entity.dart';
import '../../domain/use_case/get_all_brands_use_case.dart';
import '../../domain/use_case/get_all_categories_use_case.dart';
import 'home_tab_states.dart';

@injectable
class HomeScreenCubit extends Cubit<HomeTabStates> {
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetAllBrandsUseCase getAllBrandsUseCase ;

  HomeScreenCubit({required this.getAllCategoriesUseCase,
  required this.getAllBrandsUseCase})
      : super(HomeTabInitialState());

  List<CategoryOrBrandEntity> categoriesList = [];
  List<CategoryOrBrandEntity> brandsList = [];
  List<String> sliderImages = [
    PngAssets.carouselSlider1,
    PngAssets.carouselSlider2,
    PngAssets.carouselSlider3
  ];

  static HomeScreenCubit get(context)=> BlocProvider.of(context);

  void getAllCategories() async {
    emit(HomeCategoriesLoadingState());
    var either = await getAllCategoriesUseCase.invoke();
    either.fold((error) {
      emit(HomeCategoriesErrorState(failures: error));
    }, (response) {
        categoriesList = response.data!;
        if(brandsList.isNotEmpty) {
          emit(HomeCategoriesSuccessState(categoryResponseEntity: response));
        }
    });
  }

  void getAllBrands() async {
    emit(HomeBrandsLoadingState());
    var either = await getAllBrandsUseCase.invoke();
    either.fold((error) {
      emit(HomeBrandsErrorState(failures: error));
    }, (response) {
      brandsList = response.data!;
      if(categoriesList.isNotEmpty) {
        emit(HomeBrandsSuccessState(brandsResponseEntity: response));
      }
    }
    );
  }
}
