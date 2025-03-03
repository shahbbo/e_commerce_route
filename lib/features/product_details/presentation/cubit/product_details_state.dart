import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/helpers/remote/failures.dart';
import '../../domain/entities/product_details_entity.dart';
part 'product_details_state.freezed.dart';


enum ProductDetailsStateEnum { initial, loading, loaded, error }

@freezed
class ProductDetailsState with _$ProductDetailsState {
  const factory ProductDetailsState({
    required ProductDetailsStateEnum status,
    ProductDetailsEntity? productDetailsEntity,
    Failures? failures,
  }) = _ProductDetailsState;

  factory ProductDetailsState.initial() => const ProductDetailsState(status: ProductDetailsStateEnum.initial);
}

// @immutable
// sealed class ProductDetailsState {}
//
// final class ProductDetailsInitial extends ProductDetailsState {}
//
//
// final class ProductDetailsLoading extends ProductDetailsState {}
//
//
// final class ProductDetailsLoaded extends ProductDetailsState {
//   final ProductDetailsEntity productDetailsResponseEntity;
//
//   ProductDetailsLoaded(this.productDetailsResponseEntity);
// }
//
//
// final class ProductDetailsError extends ProductDetailsState {
//   final Failures failures;
//
//   ProductDetailsError(this.failures);
// }
