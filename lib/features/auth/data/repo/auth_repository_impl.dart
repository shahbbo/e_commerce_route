import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/signIn_entity.dart';
import '../../domain/entities/signUp_entity.dart';
import '../../../../core/helpers/remote/failures.dart';
import '../../domain/repo/auth_repository.dart';
import '../remote_data_source/auth_remote_data_source.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failures, SignUpEntity>> signUp(String name,
      String email, String password, String rePassword, String phone) async {
    var either = await authRemoteDataSource.signUp(
        name, email, password, rePassword, phone);
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, SignInEntity>> login(
      String email, String password) async {
    var either = await authRemoteDataSource.login(email, password);
    either.fold(
          (error) => print("Failure: ${error.errorMessage}"),
          (response) => print("Success: ${response.statusMsg}  & ${response.message}"),
    );
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
