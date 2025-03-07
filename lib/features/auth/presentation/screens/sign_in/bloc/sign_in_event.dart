part of 'sign_in_bloc.dart';

sealed class SignInEvent {}

final class SignInWithEmailAndPasswordEvent extends SignInEvent {
  final String email;
  final String password;

  SignInWithEmailAndPasswordEvent(this.email, this.password);
}
