import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/helpers/remote/failures.dart';
import '../../../../domain/entities/signin_entity.dart';
import '../../../../domain/use_case/login_use_case.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

@injectable
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInUseCase signInUseCase;

  SignInBloc({required this.signInUseCase}) : super(SignInInitial()) {
    on<SignInEvent>((event, emit) {});

    Stream<SignInState> mapEventToState(SignInEvent event) async* {
      if (event is SignInWithEmailAndPasswordEvent) {
        yield SignInLoading();
        var either = await signInUseCase.invoke(event.email, event.password);
        yield* either.fold(
          (failure) async* {
            yield SignInFailure(failures: failure);
          },
          (response) async* {
            yield SignInSuccess(responseEntity: response);
          },
        );
      }
    }
  }
}
