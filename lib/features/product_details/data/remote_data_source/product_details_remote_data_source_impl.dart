import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/core/helpers/remote/failures.dart';
import 'package:e_commerce_route/core/helpers/remote/dio_helper.dart';
import 'package:e_commerce_route/core/resources/constants_manager.dart';
import 'package:e_commerce_route/features/product_details/data/remote_data_source/product_details_remote_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/helpers/remote/api_helper.dart';
import '../data_transfer_object/product_details_dto.dart';

@Injectable(as: ProductDetailsRemoteDataSource)
class ProductDetailsRemoteDataSourceImpl implements ProductDetailsRemoteDataSource {

 final DioHelper apiManager;

  ProductDetailsRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures,ProductDetailsDto>> getProductDetails(String productId) async{
    return ApiHelper.safeApiCallWithInterceptor(
      () => apiManager.get('${EndPoints.products}/$productId'),
      (data) => ProductDetailsDto.fromJson(data),
    );
  }
}