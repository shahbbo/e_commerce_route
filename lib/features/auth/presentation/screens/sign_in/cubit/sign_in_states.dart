
import '../../../../domain/entities/signIn_entity.dart';
import '../../../../../../core/helpers/remote/failures.dart';

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