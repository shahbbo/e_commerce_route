import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:injectable/injectable.dart';

import '../../domain/entities/get_cart_entity.dart';
import '../../domain/use_cases/delete_item_in_cart_use_case.dart';
import '../../domain/use_cases/get_cart_use_case.dart';
import '../../domain/use_cases/update_count_in_cart_use_case.dart';
import 'cart_states.dart';

@injectable
class CartScreenCubit extends Cubit<CartStates> {
  GetCartUseCase getCartUseCase;
  DeleteItemInCartUseCase deleteItemInCartUseCase;

  UpdateCountInCartUseCase updateCountInCartUseCase;

  CartScreenCubit(
      {required this.getCartUseCase,
      required this.deleteItemInCartUseCase,
      required this.updateCountInCartUseCase})
      : super(CartStates.initial());

  static CartScreenCubit get(context) => BlocProvider.of(context);

  GetCartEntity cartResponse = GetCartEntity();

  void getCart() async {
    emit(CartStates.getCartLoading());
    var either = await getCartUseCase.invoke();
    either.fold((l) => emit(CartStates.getCartError(failures: l)), (response) {
      cartResponse = response;
      emit(CartStates.getCartSuccess(cartResponseEntity: response));
    });
  }

  void deleteItemInCart(String productId) async {
    emit(CartStates.deleteItemInCartLoading());
    var either = await deleteItemInCartUseCase.invoke(productId);
    either.fold((l) => emit(CartStates.deleteItemInCartError(failures: l)),
        (response) {
      emit(CartStates.getCartSuccess(cartResponseEntity: response));
      getCart();
    });
  }

  void updateCountInCart(String productId, int count) async {
    emit(CartStates.updateCountInCartLoading());
    var either = await updateCountInCartUseCase.invoke(productId, count);
    either.fold((l) {
      emit(CartStates.updateCountInCartError(failures: l));
    }, (response) {
      emit(CartStates.updateCountInCartSuccess(cartResponseEntity: response));
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
