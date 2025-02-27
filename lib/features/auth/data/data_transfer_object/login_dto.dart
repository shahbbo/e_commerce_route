import '../../domain/entities/signIn_entity.dart';

class LoginDto extends SignInEntity {
  LoginDto({
    super.message,
    super.user,
    super.statusMsg,
    super.token,
  });

  LoginDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? LoginUserDto.fromJson(json['user']) : null;
    token = json['token'];
  }
}

class LoginUserDto extends LoginUserEntity {
  LoginUserDto({
    super.name,
    super.email,
    this.role,
  });

  LoginUserDto.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  String? role;
}
