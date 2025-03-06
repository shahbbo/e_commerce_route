import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:injectable/injectable.dart';

import '../../domain/entities/get_cart_entity.dart';
import '../../domain/use_cases/delete_item_in_cart_use_case.dart';
import '../../domain/use_cases/get_cart_use_case.dart';
import '../../domain/use_cases/update_count_in_cart_use_case.dart';
import 'cart_states.dart';

@injectable
class CartScreenCubit extends Cubit<CartState> {
  GetCartUseCase getCartUseCase;
  DeleteItemInCartUseCase deleteItemInCartUseCase;

  UpdateCountInCartUseCase updateCountInCartUseCase;

  CartScreenCubit(
      {required this.getCartUseCase,
      required this.deleteItemInCartUseCase,
      required this.updateCountInCartUseCase})
      : super(CartState.initial());

  static CartScreenCubit get(context) => BlocProvider.of(context);

  GetCartEntity cartResponse = GetCartEntity();

  void getCart() async {
    emit(state.copyWith(status: CartStatus.getCartLoading));
    var either = await getCartUseCase.invoke();
    either.fold(
        (l) =>
            emit(state.copyWith(status: CartStatus.getCartError, failures: l)),
        (response) {
      cartResponse = response;
      emit(state.copyWith(
          status: CartStatus.getCartSuccess, cartResponseEntity: response));
    });
  }

  void deleteItemInCart(String productId) async {
    emit(state.copyWith(status: CartStatus.deleteItemInCartLoading));
    var either = await deleteItemInCartUseCase.invoke(productId);
    either.fold(
        (l) => emit(state.copyWith(
            status: CartStatus.deleteItemInCartError,
            failures: l)), (response) {
      (response) {
        emit(state.copyWith(
            status: CartStatus.getCartSuccess, cartResponseEntity: response));
        getCart();
      };
    });
  }

  void updateCountInCart(String productId, int count) async {
    emit(state.copyWith(status: CartStatus.updateCountInCartLoading));
    var either = await updateCountInCartUseCase.invoke(productId, count);
    either.fold((l) {
      emit(state.copyWith(
          status: CartStatus.updateCountInCartError, failures: l));
    }, (response) {
      emit(state.copyWith(
          status: CartStatus.updateCountInCartSuccess,
          cartResponseEntity: response));
      getCart();
    });
  }

// void getCart() async {
//   emit(GetCartLoadingState());
//   var either = await getCartUseCase.invoke();
//   either.fold((l) => emit(GetCartErrorState(failures: l)), (response) {
//     cartResponse = response;
//     emit(GetCartSuccessState(cartResponseEntity: response));
//   });
// }
//
// void deleteItemInCart(String productId) async {
//   emit(DeleteItemInCartLoadingState());
//   var either = await deleteItemInCartUseCase.invoke(productId);
//   either.fold((l) => emit(DeleteItemInCartErrorState(failures: l)),
//       (response) {
//     emit(GetCartSuccessState(cartResponseEntity: response));
//     getCart();
//   });
// }
//
// void updateCountInCart(String productId, int count) async {
//   emit(UpdateCountInCartLoadingState());
//   var either = await updateCountInCartUseCase.invoke(productId, count);
//   either.fold((l) {
//     emit(UpdateCountInCartErrorState(failures: l));
//   }, (response) {
//     emit(UpdateCountInCartSuccessState(cartResponseEntity: response));
//     getCart();
//   });
// }
}
