import 'package:dartz/dartz.dart';

import '../entities/signin_entity.dart';
import '../entities/signup_entity.dart';
import '../../../../core/helpers/remote/failures.dart';

abstract class AuthRepository{
  Future<Either<Failures,SignUpEntity>> signUp(String name ,
      String email , String password,
      String rePassword , String phone);

  Future<Either<Failures,SignInEntity>> login(String email , String password,);

}