part of 'wish_list_cubit.dart';

@immutable
sealed class WishListState {}

final class WishListInitial extends WishListState {}

final class GetWishListLoadingState extends WishListState {}

final class GetWishListSuccessState extends WishListState {
  final WishListEntity wishListResponseEntity;
  GetWishListSuccessState({required this.wishListResponseEntity});
}

final class GetWishListErrorState extends WishListState {
  final Failures failures;
  GetWishListErrorState({required this.failures});
}

final class AddRemoveWishListLoadingState extends WishListState {}

final class AddRemoveWishListSuccessState extends WishListState {
  final AddRemoveWishListEntity addToWishListResponseEntity;
  AddRemoveWishListSuccessState({required this.addToWishListResponseEntity});
}

final class AddRemoveWishListErrorState extends WishListState {
  final Failures failures;
  AddRemoveWishListErrorState({required this.failures});
}
