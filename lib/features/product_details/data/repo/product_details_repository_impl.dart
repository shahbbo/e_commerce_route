
import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/core/helpers/remote/failures.dart';
import 'package:e_commerce_route/features/product_details/domain/entities/product_details_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repo/product_details_repository.dart';
import '../remote_data_source/product_details_remote_data_source.dart';

@Injectable(as: ProductDetailsRepository)
class ProductDetailsRepositoryImpl implements ProductDetailsRepository {
  final ProductDetailsRemoteDataSource productDetailsRemoteDataSource;

  ProductDetailsRepositoryImpl({required this.productDetailsRemoteDataSource});

  @override
  Future<Either<Failures,ProductDetailsEntity>> getProductDetails(String productId) async {
    var either = await productDetailsRemoteDataSource.getProductDetails(productId);
    return either.fold((l) => Left(l), (response) => Right(response));
  }
}