import 'package:dartz/dartz.dart';
import '../../domain/entities/signin_entity.dart';
import '../../domain/entities/signup_entity.dart';
import '../../../../core/helpers/remote/failures.dart';

abstract class AuthRemoteDataSource{
  Future<Either<Failures,SignUpEntity>> signUp(String name ,
      String email , String password,
      String rePassword , String phone);

  Future<Either<Failures,SignInEntity>> login(String email , String password,);


}