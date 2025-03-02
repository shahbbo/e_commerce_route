import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/helpers/remote/api_helper.dart';
import '../../../../core/resources/constants_manager.dart';
import '../../../../core/helpers/remote/failures.dart';
import '../../../../core/helpers/remote/dio_helper.dart';
import '../data_transfer_object/add_to_cart_dto.dart';
import '../data_transfer_object/product_dto.dart';
import 'products_remote_data_source.dart';

@Injectable(as: ProductsRemoteDataSource)
class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  DioHelper apiManager;

  ProductsRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, ProductRDto>> getAllProducts()async {
    return ApiHelper.safeApiCall(
      () => apiManager.get(EndPoints.products),
      (data) => ProductRDto.fromJson(data),
    );
  }

  @override
  Future<Either<Failures, AddToCartDto>> addToCart(
      String productId) async {
    return ApiHelper.safeApiCall(
      () => apiManager.post(EndPoints.cart, body: {'productId': productId}),
      (data) => AddToCartDto.fromJson(data),
    );
  }
}
