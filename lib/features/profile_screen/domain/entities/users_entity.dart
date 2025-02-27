class UsersResponseEntity {
  UsersResponseEntity({
      this.totalUsers, 
      this.users,});
  num? totalUsers;
  List<UsersEntity>? users;

}

class UsersEntity {
  UsersEntity({
      this.id, 
      this.name, 
      this.email, 
  });

  String? id;
  String? name;
  String? email;

}