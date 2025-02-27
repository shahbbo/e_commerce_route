import '../../domain/entities/users_entity.dart';

class UsersResponseDto extends UsersResponseEntity {
  UsersResponseDto({
    super.totalUsers,
    super.users,});

  UsersResponseDto.fromJson(dynamic json) {
    totalUsers = json['totalUsers'];
    if (json['users'] != null) {
      users = [];
      json['users'].forEach((v) {
        users?.add(UsersDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['totalUsers'] = totalUsers;
    map['users'] = users;
    return map;
  }
}

class UsersDto extends UsersEntity {
  UsersDto({
    super.id,
    super.name,
    super.email,
  });

  UsersDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    email = json['email'];
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['email'] = email;
    return map;
  }

}