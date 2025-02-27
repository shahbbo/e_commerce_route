
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/helpers/remote/failures.dart';
import '../entities/wishList_entity.dart';
import '../repo/wishlist_repository.dart';

@injectable
class GetWishlistUseCase {
  final WishlistRepository repository;
  GetWishlistUseCase(this.repository);
  Future<Either<Failures, WishListEntity>> invoke() async {
    return repository.getWishList();
  }
}