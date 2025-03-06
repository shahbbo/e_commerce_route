import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/core/helpers/remote/dio_helper.dart';
import 'package:e_commerce_route/core/resources/constants_manager.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/helpers/remote/api_helper.dart';
import '../../../../core/helpers/remote/failures.dart';
import '../data_transfer_object/add_remove_wish_list_dto.dart';
import '../data_transfer_object/wish_list_response_dto.dart';
import 'wishlist_remote_data_source.dart';

@Injectable(as: WishlistRemoteDataSource)
class WishlistRemoteDataSourceImpl implements WishlistRemoteDataSource {
  final DioHelper apiManager;
  WishlistRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, WishListDto>> getWishList() {
    return ApiHelper.safeApiCall(
          () => apiManager.get(EndPoints.wishList),
          (data) => WishListDto.fromJson(data),
    );
  }

  @override
  Future<Either<Failures, AddRemoveWishListDto>> addToWishList(String productId) {
    return ApiHelper.safeApiCall(
          () => apiManager.post(EndPoints.wishList, body: {'productId': productId}),
          (data) => AddRemoveWishListDto.fromJson(data),
    );
  }

  @override
  Future<Either<Failures, AddRemoveWishListDto>> removeFromWishList(String productId) {
    return ApiHelper.safeApiCall(
          () => apiManager.delete('${EndPoints.wishList}/$productId'),
          (data) => AddRemoveWishListDto.fromJson(data),
    );
  }
}
