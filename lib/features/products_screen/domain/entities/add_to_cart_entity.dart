class AddToCartEntity {
  AddToCartEntity({
    this.status,
    this.message,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });

  String? status;
  String? message;
  num? numOfCartItems;
  String? cartId;
  AddDataCartEntity? data;
}

class AddDataCartEntity {
  AddDataCartEntity({
    this.id,
    this.cartOwner,
    this.products,
    this.v,
    this.totalCartPrice,
  });

  String? id;
  String? cartOwner;
  List<AddProductEntity>? products;
  num? v;
  num? totalCartPrice;
}

class AddProductEntity {
  AddProductEntity({
    this.count,
    this.id,
    this.product,
    this.price,
  });

  num? count;
  String? id;
  String? product;
  num? price;
}
