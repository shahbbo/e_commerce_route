import 'package:dartz/dartz.dart';

import '../../../../core/helpers/remote/failures.dart';
import '../entities/get_cart_entity.dart';


abstract class CartRepository {
  Future<Either<Failures, GetCartEntity>> getCart();

  Future<Either<Failures, GetCartEntity>> deleteItemInCart(
      String productId);

  Future<Either<Failures, GetCartEntity>> updateCountInCart(
      String productId, int count);
}
