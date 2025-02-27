import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../entities/signUp_entity.dart';
import '../../../../core/helpers/remote/failures.dart';
import '../repo/auth_repository.dart';

@injectable
class SignUpUseCase {
  AuthRepository authRepository;

  SignUpUseCase({required this.authRepository});

  Future<Either<Failures, SignUpEntity>> invoke(String name,
      String email, String password, String rePassword, String phone) {
    return authRepository.signUp(
        name, email, password, rePassword, phone);
  }
}
