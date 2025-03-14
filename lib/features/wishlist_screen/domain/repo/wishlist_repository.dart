import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/core/helpers/remote/failures.dart';
import 'package:e_commerce_route/features/wishlist_screen/domain/entities/add_remove_wishList_entity.dart';

import '../entities/wishList_entity.dart';

abstract class WishlistRepository {
  Future<Either<Failures, WishListEntity>> getWishList();

  Future<Either<Failures, AddRemoveWishListEntity>> addToWishList(String productId);

  Future<Either<Failures, AddRemoveWishListEntity>> removeFromWishList(String productId);
}
