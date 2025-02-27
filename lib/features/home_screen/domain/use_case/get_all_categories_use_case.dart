import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/category_or_brand_entity.dart';
import '../../../../core/helpers/remote/failures.dart';
import '../repo/home_repository.dart';

@injectable
class GetAllCategoriesUseCase{
  HomeRepository homeRepository ;
  GetAllCategoriesUseCase({required this.homeRepository});

  Future<Either<Failures,CategoryOrBrandResponseEntity>> invoke(){
    return homeRepository.getAllCategories();
  }
}