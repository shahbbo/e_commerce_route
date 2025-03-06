import 'package:dartz/dartz.dart';

import '../../../../core/helpers/remote/failures.dart';
import '../../domain/entities/add_remove_wish_list_entity.dart';
import '../../domain/entities/wish_list_entity.dart';

abstract class WishlistRemoteDataSource {

  Future<Either<Failures, WishListEntity>> getWishList();

  Future<Either<Failures, AddRemoveWishListEntity>> addToWishList(String productId);

  Future<Either<Failures, AddRemoveWishListEntity>> removeFromWishList(String productId);
}