import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/helpers/remote/api_helper.dart';
import '../../../../core/resources/constants_manager.dart';
import '../../../../core/helpers/remote/failures.dart';
import '../../../../core/helpers/remote/dio_helper.dart';
import '../data_transfer_object/login_dto.dart';
import '../data_transfer_object/signup_dto.dart';
import 'auth_remote_data_source.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  DioHelper apiManager;

  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, SignUpResponseDto>> signUp(String name, String email,
      String password, String rePassword, String phone) async {
    return ApiHelper.safeApiCall(
      () => apiManager.post(EndPoints.register, body: {
        'name': name,
        'email': email,
        'password': password,
        'rePassword': rePassword,
        'phone': phone
      }),
      (data) => SignUpResponseDto.fromJson(data),
    );
  }

  @override
  Future<Either<Failures, LoginDto>> login(
      String email, String password) async {
    return ApiHelper.safeApiCall(
      () => apiManager
          .post(EndPoints.login, body: {'email': email, 'password': password}),
      (data) => LoginDto.fromJson(data),
    );
  }
}
