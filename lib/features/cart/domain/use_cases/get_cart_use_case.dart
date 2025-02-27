import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/helpers/remote/failures.dart';
import '../entities/get_cart_entity.dart';
import '../repository/cart_repository.dart';

@injectable
class GetCartUseCase {
  CartRepository cartRepository;

  GetCartUseCase({required this.cartRepository});

  Future<Either<Failures, GetCartEntity>> invoke() {
    return cartRepository.getCart();
  }
}
