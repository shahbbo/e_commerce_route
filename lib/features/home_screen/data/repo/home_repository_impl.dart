import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

import '../../domain/entities/category_or_brand_entity.dart';
import '../../../../core/helpers/remote/failures.dart';
import '../../domain/repo/home_repository.dart';
import '../remote_data_source/home_remote_data_source.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategories() async {
    var either = await homeRemoteDataSource.getAllCategories();
    return either.fold((l) => Left(l), (response) => Right(response));
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands() async {
    var either = await homeRemoteDataSource.getAllBrands();
    return either.fold((l) => Left(l), (response) => Right(response));
  }

}
