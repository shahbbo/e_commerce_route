import 'package:e_commerce_route/features/auth/presentation/screens/sign_up/cubit/sign_up_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/use_case/signUp_use_case.dart';

@injectable
class RegisterCubit extends Cubit<RegisterStates> {
  SignUpUseCase registerUseCase;

  var nameController = TextEditingController(text: 'Ahmed Abd Al-Muti');
  var emailController = TextEditingController(text: 'ahmedmutti0123@gmail.com');
  var passwordController = TextEditingController(text: 'Ahmed@123');
  var rePasswordController = TextEditingController(text: 'Ahmed@123');
  var phoneController = TextEditingController(text: '01010711711');

  RegisterCubit({required this.registerUseCase}) : super(RegisterInitialState());

  void register() async {
    emit(RegisterLoadingState());
    var either = await registerUseCase.invoke(
        nameController.text,
        emailController.text,
        passwordController.text,
        rePasswordController.text,
        phoneController.text);
    either.fold((l) {
      emit(RegisterErrorState(failures: l));
      print('error: ${l.errorMessage}');
    }, (response) {
      emit(RegisterSuccessState(responseEntity: response));
    });
  }
}
