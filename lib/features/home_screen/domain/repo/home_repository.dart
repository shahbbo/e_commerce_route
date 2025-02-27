import 'package:dartz/dartz.dart';

import '../entities/category_or_brand_entity.dart';
import '../../../../core/helpers/remote/failures.dart';


abstract class HomeRepository{
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategories();

  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands();
}