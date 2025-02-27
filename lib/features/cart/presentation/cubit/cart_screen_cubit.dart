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
      : super(CartInitialState());

  GetCartEntity cartResponse = GetCartEntity();

  static CartScreenCubit get(context) => BlocProvider.of(context);

  void getCart() async {
    emit(GetCartLoadingState());
    var either = await getCartUseCase.invoke();
    either.fold((l) => emit(GetCartErrorState(failures: l)), (response) {
      cartResponse = response;
      emit(GetCartSuccessState(cartResponseEntity: response));
    });
  }

  void deleteItemInCart(String productId) async {
    emit(DeleteItemInCartLoadingState());
    var either = await deleteItemInCartUseCase.invoke(productId);
    either.fold((l) => emit(DeleteItemInCartErrorState(failures: l)),
        (response) {
      emit(GetCartSuccessState(cartResponseEntity: response));
      getCart();
    });
  }

  void updateCountInCart(String productId, int count) async {
    emit(UpdateCountInCartLoadingState());
    var either = await updateCountInCartUseCase.invoke(productId, count);
    either.fold((l) {
      emit(UpdateCountInCartErrorState(failures: l));
    }, (response) {
      emit(UpdateCountInCartSuccessState(cartResponseEntity: response));
      getCart();
    });
  }
}
