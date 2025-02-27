
import '../../domain/entities/add_to_cart_entity.dart';

class AddToCartDto extends AddToCartEntity {
  AddToCartDto({
    super.status,
    super.message,
    super.numOfCartItems,
    super.cartId,
    this.statusMsg,
    super.data,
  });

  AddToCartDto.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? AddDataCartDto.fromJson(json['data']) : null;
  }

  String? statusMsg;
}

class AddDataCartDto extends AddDataCartEntity {
  AddDataCartDto({
    super.id,
    super.cartOwner,
    super.products,
    super.v,
    super.totalCartPrice,
  });

  AddDataCartDto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(AddProductDto.fromJson(v));
      });
    }
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }

}

class AddProductDto extends AddProductEntity {
  AddProductDto({
    super.count,
    super.id,
    super.product,
    super.price,
  });

  AddProductDto.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }
}
