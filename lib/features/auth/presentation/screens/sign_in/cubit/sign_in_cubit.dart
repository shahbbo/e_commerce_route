import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/use_case/login_use_case.dart';
import 'sign_in_states.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  SignInUseCase signInUseCase;

  var emailController = TextEditingController(text: 'ahmedmutti401@gmail.com');
  var passwordController = TextEditingController(text: 'Ahmed@123');

  SignInCubit({required this.signInUseCase}) : super(SignInState.initial());

  Future<void> login() async {
    emit(state.copyWith(status: SignInStateStatus.loading));
    var either = await signInUseCase.invoke(
      emailController.text,
      passwordController.text,
    );
    either.fold(
      (failures) {
        emit(state.copyWith(
          status: SignInStateStatus.error,
          failures: failures,
        ));
      },
      (responseEntity) {
        emit(state.copyWith(
          status: SignInStateStatus.success,
          responseEntity: responseEntity,
        ));
      },
    );
  }

/*void login() async {
  emit(LoginLoadingState());
  var either = await signInUseCase.invoke(
    emailController.text,
    passwordController.text,
  );
  either.fold((l) {
    emit(LoginErrorState(failures: l));
  }, (response) {
    emit(LoginSuccessState(responseEntity: response));
  });
}*/


  void disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Future<void> close() {
    disposeControllers();
    return super.close();
  }
}
