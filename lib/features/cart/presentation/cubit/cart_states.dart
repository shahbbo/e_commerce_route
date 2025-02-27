

import '../../../../core/helpers/remote/failures.dart';
import '../../domain/entities/get_cart_entity.dart';

abstract class CartStates {}

class CartInitialState extends CartStates {}

class GetCartLoadingState extends CartStates {}

class GetCartErrorState extends CartStates {
  Failures failures;

  GetCartErrorState({required this.failures});
}

class GetCartSuccessState extends CartStates {
  GetCartEntity cartResponseEntity;

  GetCartSuccessState({required this.cartResponseEntity});
}

class DeleteItemInCartLoadingState extends CartStates {}

class DeleteItemInCartErrorState extends CartStates {
  Failures failures;

  DeleteItemInCartErrorState({required this.failures});
}

class DeleteItemInCartSuccessState extends CartStates {
  GetCartEntity cartResponseEntity;

  DeleteItemInCartSuccessState({required this.cartResponseEntity});
}

class UpdateCountInCartLoadingState extends CartStates {}

class UpdateCountInCartErrorState extends CartStates {
  Failures failures;

  UpdateCountInCartErrorState({required this.failures});
}

class UpdateCountInCartSuccessState extends CartStates {
  GetCartEntity cartResponseEntity;

  UpdateCountInCartSuccessState({required this.cartResponseEntity});
}
