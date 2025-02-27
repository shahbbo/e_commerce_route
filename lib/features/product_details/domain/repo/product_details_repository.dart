import 'package:dartz/dartz.dart';

import '../../../../core/helpers/remote/failures.dart';
import '../entities/product_details_entity.dart';

abstract class ProductDetailsRepository {
  Future<Either<Failures,ProductDetailsEntity>> getProductDetails(String productId);
}