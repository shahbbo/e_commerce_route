
import  '../../../../core/helpers/remote/failures.dart';
import '../../../wishlist_screen/domain/entities/wishList_entity.dart';
import '../../domain/entities/add_to_cart_entity.dart';
import '../../../wishlist_screen/domain/entities/add_remove_wishList_entity.dart';
import '../../domain/entities/product_entity.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_screen_states.freezed.dart';


@freezed
class ProductScreenStates with _$ProductScreenStates {
  const factory ProductScreenStates.productInitialState() = ProductInitialState;
  const factory ProductScreenStates.productsLoadingState() = ProductsLoadingState;
  const factory ProductScreenStates.productsErrorState({required Failures failures}) = ProductsErrorState;
  const factory ProductScreenStates.productsSuccessState({required ProductREntity productResponseEntity}) = ProductsSuccessState;
  const factory ProductScreenStates.addToCartLoadingState() = AddToCartLoadingState;
  const factory ProductScreenStates.addToCartErrorState({required Failures failures}) = AddToCartErrorState;
  const factory ProductScreenStates.addToCartSuccessState({required AddToCartEntity addToCartEntity}) = AddToCartSuccessState;
  const factory ProductScreenStates.wishListLoadingState() = WishListLoadingState;
  const factory ProductScreenStates.wishListErrorState({required Failures failures}) = WishListErrorState;
  const factory ProductScreenStates.wishListSuccessState({required WishListEntity wishListEntity}) = WishListSuccessState;
  const factory ProductScreenStates.addRemoveWishListLoadingState() = AddRemoveWishListLoadingState;
  const factory ProductScreenStates.addRemoveWishListErrorState({required Failures failures}) = AddRemoveWishListErrorState;
  const factory ProductScreenStates.addRemoveWishListSuccessState({required AddRemoveWishListEntity addRemoveToWishListEntity}) = AddRemoveWishListSuccessState;
}


// abstract class ProductScreenStates {}
//
// class ProductInitialState extends ProductScreenStates {}
//
// class ProductLoadingState extends ProductScreenStates {}
//
// class ProductErrorState extends ProductScreenStates {
//   Failures failures;
//
//   ProductErrorState({required this.failures});
// }
//
// class ProductSuccessState extends ProductScreenStates {
//   ProductREntity productResponseEntity;
//
//   ProductSuccessState({required this.productResponseEntity});
// }
//
// class AddToCartLoadingState extends ProductScreenStates {}
//
// class AddToCartErrorState extends ProductScreenStates {
//   Failures failures;
//
//   AddToCartErrorState({required this.failures});
// }
//
// class AddToCartSuccessState extends ProductScreenStates {
//   AddToCartEntity addToCartResponseEntity;
//
//   AddToCartSuccessState({required this.addToCartResponseEntity});
// }
//
// class WishListLoadingState extends ProductScreenStates {}
//
// class WishListErrorState extends ProductScreenStates {
//   Failures failures;
//
//   WishListErrorState({required this.failures});
// }
// class WishListSuccessState extends ProductScreenStates {
//   WishListEntity wishListResponseEntity;
//
//   WishListSuccessState({required this.wishListResponseEntity});
// }
// class AddWishListLoadingState extends ProductScreenStates {}
// class AddWishListErrorState extends ProductScreenStates {
//   Failures failures;
//
//   AddWishListErrorState({required this.failures});
// }
// class RemoveWishListErrorState extends ProductScreenStates {
//   Failures failures;
//
//   RemoveWishListErrorState({required this.failures});
// }
// class AddWishListSuccessState extends ProductScreenStates {
//   AddRemoveWishListEntity addToWishListResponseEntity;
//
//   AddWishListSuccessState({required this.addToWishListResponseEntity});
// }
// class RemoveWishListSuccessState extends ProductScreenStates {
//   AddRemoveWishListEntity addToWishListResponseEntity;
//
//   RemoveWishListSuccessState({required this.addToWishListResponseEntity});
// }
