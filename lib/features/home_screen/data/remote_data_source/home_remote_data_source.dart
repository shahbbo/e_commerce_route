import 'package:dartz/dartz.dart';

import '../../domain/entities/category_or_brand_entity.dart';
import '../../../../core/helpers/remote/failures.dart';

abstract class HomeRemoteDataSource{
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategories();

  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands();

}