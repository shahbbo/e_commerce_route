
import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/core/helpers/remote/failures.dart';
import 'package:e_commerce_route/features/wishlist_screen/domain/entities/add_remove_wish_list_entity.dart';
import 'package:e_commerce_route/features/wishlist_screen/domain/repo/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoveFromWishlistUseCase {
  final WishlistRepository repository;
  RemoveFromWishlistUseCase(this.repository);
  Future<Either<Failures,AddRemoveWishListEntity>> invoke(productId) async {
    return repository.removeFromWishList(productId);
  }
}