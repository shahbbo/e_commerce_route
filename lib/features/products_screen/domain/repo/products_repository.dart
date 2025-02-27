import 'package:dartz/dartz.dart';

import '../../../products_screen/domain/entities/add_to_cart_entity.dart';
import '../../../products_screen/domain/entities/product_entity.dart';
import '../../../../core/helpers/remote/failures.dart';


abstract class ProductsRepository{

  Future<Either<Failures, ProductREntity>> getAllProducts();

  Future<Either<Failures, AddToCartEntity>> addToCart(String productId);
}