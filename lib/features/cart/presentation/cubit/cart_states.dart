
import '../../../../core/helpers/remote/failures.dart';
import '../../domain/entities/get_cart_entity.dart';


import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_states.freezed.dart';

enum CartStatus {
  initial,
  getCartLoading,
  getCartError,
  getCartSuccess,
  deleteItemInCartLoading,
  deleteItemInCartError,
  deleteItemInCartSuccess,
  updateCountInCartLoading,
  updateCountInCartError,
  updateCountInCartSuccess,
}

@freezed
class CartState with _$CartState {
  const factory CartState({
    required CartStatus status,
    GetCartEntity? cartResponseEntity,
    Failures? failures,
  }) = _CartState;

  factory CartState.initial() => const CartState(status: CartStatus.initial);
}



/*@freezed
class CartStates with _$CartStates {
  const factory CartStates.initial() = CartInitialState;

  const factory CartStates.getCartLoading() = GetCartLoadingState;

  const factory CartStates.getCartError({required Failures failures}) = GetCartErrorState;

  const factory CartStates.getCartSuccess({required GetCartEntity cartResponseEntity}) = GetCartSuccessState;

  const factory CartStates.deleteItemInCartLoading() = DeleteItemInCartLoadingState;

  const factory CartStates.deleteItemInCartError({required Failures failures}) = DeleteItemInCartErrorState;

  const factory CartStates.deleteItemInCartSuccess({required GetCartEntity cartResponseEntity}) = DeleteItemInCartSuccessState;

  const factory CartStates.updateCountInCartLoading() = UpdateCountInCartLoadingState;

  const factory CartStates.updateCountInCartError({required Failures failures}) = UpdateCountInCartErrorState;

  const factory CartStates.updateCountInCartSuccess({required GetCartEntity cartResponseEntity}) = UpdateCountInCartSuccessState;
}*/

// abstract class CartStates {}
//
// class CartInitialState extends CartStates {}
//
// class GetCartLoadingState extends CartStates {}
//
// class GetCartErrorState extends CartStates {
//   Failures failures;
//
//   GetCartErrorState({required this.failures});
// }
//
// class GetCartSuccessState extends CartStates {
//   GetCartEntity cartResponseEntity;
//
//   GetCartSuccessState({required this.cartResponseEntity});
// }
//
// class DeleteItemInCartLoadingState extends CartStates {}
//
// class DeleteItemInCartErrorState extends CartStates {
//   Failures failures;
//
//   DeleteItemInCartErrorState({required this.failures});
// }
//
// class DeleteItemInCartSuccessState extends CartStates {
//   GetCartEntity cartResponseEntity;
//
//   DeleteItemInCartSuccessState({required this.cartResponseEntity});
// }
//
// class UpdateCountInCartLoadingState extends CartStates {}
//
// class UpdateCountInCartErrorState extends CartStates {
//   Failures failures;
//
//   UpdateCountInCartErrorState({required this.failures});
// }
//
// class UpdateCountInCartSuccessState extends CartStates {
//   GetCartEntity cartResponseEntity;
//
//   UpdateCountInCartSuccessState({required this.cartResponseEntity});
// }
