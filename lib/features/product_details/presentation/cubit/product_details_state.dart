part of 'product_details_cubit.dart';

@immutable
sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}


final class ProductDetailsLoading extends ProductDetailsState {}


final class ProductDetailsLoaded extends ProductDetailsState {
  final ProductDetailsEntity productDetailsResponseEntity;

  ProductDetailsLoaded(this.productDetailsResponseEntity);
}


final class ProductDetailsError extends ProductDetailsState {
  final Failures failures;

  ProductDetailsError(this.failures);
}
