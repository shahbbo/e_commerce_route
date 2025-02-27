
import '../../../../core/helpers/remote/failures.dart';
import '../../../wishlist_screen/domain/entities/wishList_entity.dart';
import '../../domain/entities/add_to_cart_entity.dart';
import '../../../wishlist_screen/domain/entities/add_remove_wishList_entity.dart';
import '../../domain/entities/product_entity.dart';

abstract class ProductScreenStates {}

class ProductInitialState extends ProductScreenStates {}

class ProductLoadingState extends ProductScreenStates {}

class ProductErrorState extends ProductScreenStates {
  Failures failures;

  ProductErrorState({required this.failures});
}

class ProductSuccessState extends ProductScreenStates {
  ProductREntity productResponseEntity;

  ProductSuccessState({required this.productResponseEntity});
}

class AddToCartLoadingState extends ProductScreenStates {}

class AddToCartErrorState extends ProductScreenStates {
  Failures failures;

  AddToCartErrorState({required this.failures});
}

class AddToCartSuccessState extends ProductScreenStates {
  AddToCartEntity addToCartResponseEntity;

  AddToCartSuccessState({required this.addToCartResponseEntity});
}

class WishListLoadingState extends ProductScreenStates {}

class WishListErrorState extends ProductScreenStates {
  Failures failures;

  WishListErrorState({required this.failures});
}
class WishListSuccessState extends ProductScreenStates {
  WishListEntity wishListResponseEntity;

  WishListSuccessState({required this.wishListResponseEntity});
}
class AddWishListLoadingState extends ProductScreenStates {}
class AddWishListErrorState extends ProductScreenStates {
  Failures failures;

  AddWishListErrorState({required this.failures});
}
class RemoveWishListErrorState extends ProductScreenStates {
  Failures failures;

  RemoveWishListErrorState({required this.failures});
}
class AddWishListSuccessState extends ProductScreenStates {
  AddRemoveWishListEntity addToWishListResponseEntity;

  AddWishListSuccessState({required this.addToWishListResponseEntity});
}
class RemoveWishListSuccessState extends ProductScreenStates {
  AddRemoveWishListEntity addToWishListResponseEntity;

  RemoveWishListSuccessState({required this.addToWishListResponseEntity});
}
