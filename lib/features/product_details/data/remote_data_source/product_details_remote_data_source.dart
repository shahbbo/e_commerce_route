import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/core/helpers/remote/failures.dart';
import 'package:e_commerce_route/features/product_details/domain/entities/product_details_entity.dart';

abstract class ProductDetailsRemoteDataSource {
  Future<Either<Failures,ProductDetailsEntity>> getProductDetails(String productId);
}