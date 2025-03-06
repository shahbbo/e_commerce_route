import 'package:e_commerce_route/features/product_details/domain/use_cases/product_details_use_case.dart';
import 'package:e_commerce_route/features/product_details/presentation/cubit/product_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/product_details_entity.dart';

@injectable
class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final ProductDetailsUseCase productDetailsUseCase;

  ProductDetailsCubit({required this.productDetailsUseCase})
      : super(ProductDetailsState.initial());

  static ProductDetailsCubit get(context) => BlocProvider.of(context);

  ProductDetailsEntity productDetails = ProductDetailsEntity();


  void getProductDetails(String productId) async {
    emit(state.copyWith(status: ProductDetailsStateEnum.loading));
    final response = await productDetailsUseCase.invoke(productId);
    response.fold(
      (l) => emit(state.copyWith(status: ProductDetailsStateEnum.error, failures: l)),
      (response) {
        productDetails = response;
        emit(state.copyWith(status: ProductDetailsStateEnum.loaded, productDetailsEntity: response));
      },
    );
  }

 /* void getProductDetails(String productId) async {
    emit(ProductDetailsLoading());
    final response = await productDetailsUseCase.invoke(productId);
    response.fold(
      (l) => emit(ProductDetailsError(l)),
      (response) {
        productDetails = response;
        emit(ProductDetailsLoaded(response));
      },
    );
  }*/

}
