import 'package:e_commerce_route/core/helpers/remote/failures.dart';
import 'package:e_commerce_route/features/product_details/domain/use_cases/product_details_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/product_details_entity.dart';

part 'product_details_state.dart';

@injectable
class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final ProductDetailsUseCase productDetailsUseCase;

  ProductDetailsCubit({required this.productDetailsUseCase})
      : super(ProductDetailsInitial());

  static ProductDetailsCubit get(context) => BlocProvider.of(context);

  ProductDetailsEntity productDetails = ProductDetailsEntity();

  void getProductDetails(String productId) async {
    emit(ProductDetailsLoading());
    final response = await productDetailsUseCase.invoke(productId);
    response.fold(
      (l) => emit(ProductDetailsError(l)),
      (response) {
        productDetails = response;
        emit(ProductDetailsLoaded(response));
      },
    );
  }
}
