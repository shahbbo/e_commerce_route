import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/use_case/signUp_use_case.dart';
import 'sign_up_states.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  SignUpUseCase registerUseCase;

  var nameController = TextEditingController(text: 'Ahmed Abd Al-Muti');
  var emailController = TextEditingController(text: 'ahmedmutti0123@gmail.com');
  var passwordController = TextEditingController(text: 'Ahmed@123');
  var rePasswordController = TextEditingController(text: 'Ahmed@123');
  var phoneController = TextEditingController(text: '01010711711');

  SignUpCubit({required this.registerUseCase}) : super(SignUpState.initial());


  void register() async {
    emit(state.copyWith(status: SignUpStateStatus.loading));
    var either = await registerUseCase.invoke(
        nameController.text,
        emailController.text,
        passwordController.text,
        rePasswordController.text,
        phoneController.text);
    either.fold((l) {
      emit(state.copyWith(status: SignUpStateStatus.error, failures: l));
    }, (response) {
      emit(state.copyWith(status: SignUpStateStatus.success, responseEntity: response));
    });
  }

/*  void register() async {
    emit(SignUpLoadingState());
    var either = await registerUseCase.invoke(
        nameController.text,
        emailController.text,
        passwordController.text,
        rePasswordController.text,
        phoneController.text);
    either.fold((l) {
      emit(SignUpErrorState(failures: l));
    }, (response) {
      emit(SignUpSuccessState(responseEntity: response));
    });
  }*/
  void disposeControllers() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    phoneController.dispose();
  }

  @override
  Future<void> close() {
    disposeControllers();
    return super.close();
  }
}
