import '../../domain/entities/add_remove_wish_list_entity.dart';

class AddRemoveWishListDto extends AddRemoveWishListEntity{
  AddRemoveWishListDto({
      super.status,
      super.message,
      super.data,});

  AddRemoveWishListDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['data'] = data;
    return map;
  }

}