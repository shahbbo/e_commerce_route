import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/helpers/remote/api_helper.dart';
import '../../../../core/helpers/remote/dio_helper.dart';
import '../../../../core/resources/constants_manager.dart';
import '../../../../core/helpers/remote/failures.dart';
import '../data_transfer_object/get_cart_dto.dart';
import 'cart_remote_data_source.dart';

@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  DioHelper apiManager;
  CartRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, GetCartDto>> getCart() async {
    return ApiHelper.safeApiCall(
      () => apiManager.get(EndPoints.cart),
      (data) => GetCartDto.fromJson(data),
    );
  }

  @override
  Future<Either<Failures, GetCartDto>> deleteItemInCart(
      String productId) async {
    return ApiHelper.safeApiCall(
      () => apiManager.delete('${EndPoints.cart}/$productId'),
      (data) => GetCartDto.fromJson(data),
    );
  }

  @override
  Future<Either<Failures, GetCartDto>> updateCountInCart(
      String productId, int count) async {
    return ApiHelper.safeApiCall(
      () => apiManager.update('${EndPoints.cart}/$productId', body: {'count': count}),
      (data) => GetCartDto.fromJson(data),
    );
  }
}
