import '../../domain/entities/signup_entity.dart';

class SignUpResponseDto extends SignUpEntity {
  SignUpResponseDto({
    super.message,
    super.user,
    super.statusMsg,
    super.token,
  });

  SignUpResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
  }
}

class UserDto extends UserEntity {
  UserDto({
    super.name,
    super.email,
    this.role,
  });

  UserDto.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  String? role;
}
