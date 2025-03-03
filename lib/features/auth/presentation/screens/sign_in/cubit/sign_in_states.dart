
import '../../../../domain/entities/signIn_entity.dart';
import '../../../../../../core/helpers/remote/failures.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_states.freezed.dart';

enum SignInStateStatus {
  initial,
  loading,
  success,
  error,
}

@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    required SignInStateStatus status,
    SignInEntity? responseEntity,
    Failures? failures,
  }) = _LoginState;

  factory SignInState.initial() => const SignInState(status: SignInStateStatus.initial,);
}


abstract class SignInStates{}

class LoginInitialState extends SignInStates{}

class LoginLoadingState extends SignInStates{}

class LoginErrorState extends SignInStates{
  Failures failures ;
  LoginErrorState({required this.failures});
}

class LoginSuccessState extends SignInStates {
  SignInEntity responseEntity ;
  LoginSuccessState({required this.responseEntity});
}