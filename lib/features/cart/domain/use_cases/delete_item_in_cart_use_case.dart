import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/helpers/remote/failures.dart';
import '../entities/get_cart_entity.dart';
import '../repository/cart_repository.dart';

@injectable
class DeleteItemInCartUseCase {
  CartRepository cartRepository;

  DeleteItemInCartUseCase({required this.cartRepository});

  Future<Either<Failures, GetCartEntity>> invoke(String productId) {
    return cartRepository.deleteItemInCart(productId);
  }
}
