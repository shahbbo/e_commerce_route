
import '../../../../domain/entities/signup_entity.dart';
import '../../../../../../core/helpers/remote/failures.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_up_states.freezed.dart';



enum SignUpStateStatus {
  initial,
  loading,
  success,
  error,
}

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    required SignUpStateStatus status,
    SignUpEntity? responseEntity,
    Failures? failures,
  }) = _SignUpState;

  factory SignUpState.initial() => const SignUpState(
    status: SignUpStateStatus.initial,
  );
}


abstract class SignUpStates{}
class SignUpInitialState extends SignUpStates{}
class SignUpLoadingState extends SignUpStates{}
class SignUpErrorState extends SignUpStates{
  Failures failures ;
  SignUpErrorState({required this.failures});
}
class SignUpSuccessState extends SignUpStates {
  SignUpEntity responseEntity ;
  SignUpSuccessState({required this.responseEntity});
}