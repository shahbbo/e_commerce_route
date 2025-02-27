import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/add_to_cart_entity.dart';
import '../../../../core/helpers/remote/failures.dart';
import '../repo/products_repository.dart';

@injectable
class AddToCartUseCase {
  ProductsRepository productsRepository;
  AddToCartUseCase({required this.productsRepository});
  Future<Either<Failures, AddToCartEntity>> invoke(String productId) {
    return productsRepository.addToCart(productId);
  }
}
