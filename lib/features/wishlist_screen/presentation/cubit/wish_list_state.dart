import '../../../../core/helpers/remote/failures.dart';
import '../../domain/entities/add_remove_wishList_entity.dart';
import '../../domain/entities/wishList_entity.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'wish_list_state.freezed.dart';

enum WishListStatus {
  initial,
  getWishListLoading,
  getWishListSuccess,
  getWishListError,
  addRemoveWishListLoading,
  addRemoveWishListSuccess,
  addRemoveWishListError,
}

@freezed
class WishListState with _$WishListState {
  const factory WishListState({
    required WishListStatus status,
    WishListEntity? wishListEntity,
    AddRemoveWishListEntity? addToWishListEntity,
    Failures? failures,
  }) = _WishListState;

  factory WishListState.initial() => const WishListState(status: WishListStatus.initial);
}


/*
@freezed
class WishListState with _$WishListState {
  const factory WishListState.initial() = Initial;
  const factory WishListState.getWishListLoading() = GetWishListLoading;
  const factory WishListState.getWishListSuccess({required WishListEntity wishListEntity}) = GetWishListSuccess;
  const factory WishListState.getWishListError({required Failures failures}) = GetWishListError;
  const factory WishListState.addRemoveWishListLoading() = AddRemoveWishListLoading;
  const factory WishListState.addRemoveWishListSuccess({required AddRemoveWishListEntity addToWishListEntity}) = AddRemoveWishListSuccess;
  const factory WishListState.addRemoveWishListError({required Failures failures}) = AddRemoveWishListError;
}
*/


// sealed class WishListState {}
//
// final class WishListInitial extends WishListState {}
//
// final class GetWishListLoadingState extends WishListState {}
//
// final class GetWishListSuccessState extends WishListState {
//   final WishListEntity wishListResponseEntity;
//   GetWishListSuccessState({required this.wishListResponseEntity});
// }
//
// final class GetWishListErrorState extends WishListState {
//   final Failures failures;
//   GetWishListErrorState({required this.failures});
// }
//
// final class AddRemoveWishListLoadingState extends WishListState {}
//
// final class AddRemoveWishListSuccessState extends WishListState {
//   final AddRemoveWishListEntity addToWishListResponseEntity;
//   AddRemoveWishListSuccessState({required this.addToWishListResponseEntity});
// }
//
// final class AddRemoveWishListErrorState extends WishListState {
//   final Failures failures;
//   AddRemoveWishListErrorState({required this.failures});
// }
