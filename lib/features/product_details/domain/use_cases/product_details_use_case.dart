
import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/core/helpers/remote/failures.dart';
import 'package:e_commerce_route/features/product_details/domain/entities/product_details_entity.dart';
import 'package:injectable/injectable.dart';

import '../repo/product_details_repository.dart';

@injectable
class ProductDetailsUseCase {
  final ProductDetailsRepository repository;
  ProductDetailsUseCase(this.repository);
  Future<Either<Failures,ProductDetailsEntity>> invoke(String productId) async {
    return await repository.getProductDetails(productId);
  }
}