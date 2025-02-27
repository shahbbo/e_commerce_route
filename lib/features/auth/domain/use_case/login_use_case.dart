import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';
import '../entities/signIn_entity.dart';
import '../../../../core/helpers/remote/failures.dart';
import '../repo/auth_repository.dart';

@injectable
class SignInUseCase {
  AuthRepository authRepository;
  SignInUseCase({required this.authRepository});

  Future<Either<Failures, SignInEntity>> invoke(String email, String password){
    return authRepository.login(email, password);
  }
}
