part of 'sign_in_bloc.dart';

sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInLoading extends SignInState {}

final class SignInSuccess extends SignInState {
  final SignInEntity responseEntity;
  SignInSuccess({required this.responseEntity});
}

final class SignInFailure extends SignInState {
  final Failures failures;
  SignInFailure({required this.failures});
}
