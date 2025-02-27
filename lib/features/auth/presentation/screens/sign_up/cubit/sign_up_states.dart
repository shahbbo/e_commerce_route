
import '../../../../domain/entities/signUp_entity.dart';
import '../../../../../../core/helpers/remote/failures.dart';

abstract class RegisterStates{}
class RegisterInitialState extends RegisterStates{}
class RegisterLoadingState extends RegisterStates{}
class RegisterErrorState extends RegisterStates{
  Failures failures ;
  RegisterErrorState({required this.failures});
}
class RegisterSuccessState extends RegisterStates {
  SignUpEntity responseEntity ;
  RegisterSuccessState({required this.responseEntity});
}