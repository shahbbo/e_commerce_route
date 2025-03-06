import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/core/helpers/remote/failures.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/add_remove_wish_list_entity.dart';
import '../../domain/entities/wish_list_entity.dart';
import '../../domain/repo/wishlist_repository.dart';
import '../remote_data_source/wishlist_remote_data_source.dart';

@Injectable(as: WishlistRepository)
class WishListRepositoryImpl implements WishlistRepository {

  WishlistRemoteDataSource wishlistRemoteDataSource;

  WishListRepositoryImpl({required this.wishlistRemoteDataSource});

  @override
  Future<Either<Failures,WishListEntity>> getWishList() async {
    var either = await wishlistRemoteDataSource.getWishList();
    return either.fold((l) => Left(l), (response) => Right(response));
  }

  @override
  Future<Either<Failures,AddRemoveWishListEntity>> addToWishList(String productId) async {
    var either = await wishlistRemoteDataSource.addToWishList(productId);
    return either.fold((l) => Left(l), (response) => Right(response));

  }

  @override
  Future<Either<Failures,AddRemoveWishListEntity>> removeFromWishList(String productId) async {
    var either = await wishlistRemoteDataSource.removeFromWishList(productId);
    return either.fold((l) => Left(l), (response) => Right(response));

  }
}