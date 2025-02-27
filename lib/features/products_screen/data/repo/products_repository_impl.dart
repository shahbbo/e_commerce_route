import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

import '../../../products_screen/domain/entities/add_to_cart_entity.dart';
import '../../../products_screen/domain/entities/product_entity.dart';
import '../../../../core/helpers/remote/failures.dart';
import '../../domain/repo/products_repository.dart';
import '../remote_data_source/products_remote_data_source.dart';

@Injectable(as: ProductsRepository)
class ProductsRepositoryImpl implements  ProductsRepository{
  ProductsRemoteDataSource productsRemoteDataSource;

  ProductsRepositoryImpl({required this.productsRemoteDataSource});
  @override
  Future<Either<Failures, ProductREntity>> getAllProducts() async {
    var either = await productsRemoteDataSource.getAllProducts();
    return either.fold((l) => Left(l), (response) => Right(response));
  }

  @override
  Future<Either<Failures, AddToCartEntity>> addToCart(
      String productId) async {
    var either = await productsRemoteDataSource.addToCart(productId);
    return either.fold((l) => Left(l), (response) => Right(response));
  }
}
