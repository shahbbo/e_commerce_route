import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/helpers/remote/failures.dart';
import '../../domain/entities/get_cart_entity.dart';
import '../../domain/repository/cart_repository.dart';
import '../remote_data_source/cart_remote_data_source.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  CartRemoteDataSource cartRemoteDataSource;

  CartRepositoryImpl({required this.cartRemoteDataSource});

  @override
  Future<Either<Failures, GetCartEntity>> getCart() async {
    var either = await cartRemoteDataSource.getCart();
    return either.fold((l) => Left(l), (response) => Right(response));
  }

  @override
  Future<Either<Failures, GetCartEntity>> deleteItemInCart(
      String productId) async {
    // TODO: implement deleteItemInCart
    var either = await cartRemoteDataSource.deleteItemInCart(productId);
    return either.fold((l) => Left(l), (response) => Right(response));
  }

  @override
  Future<Either<Failures, GetCartEntity>> updateCountInCart(
      String productId, int count) async {
    // TODO: implement updateCountInCart
    var either = await cartRemoteDataSource.updateCountInCart(productId, count);
    return either.fold((l) => Left(l), (response) => Right(response));
  }
}
