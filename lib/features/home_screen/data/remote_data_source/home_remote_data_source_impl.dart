import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/helpers/remote/api_helper.dart';
import '../../../../core/resources/constants_manager.dart';
import '../../../../core/helpers/remote/failures.dart';
import '../../../../core/helpers/remote/dio_helper.dart';
import '../data_transfer_object/category_or_brand_dto.dart';
import 'home_remote_data_source.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  DioHelper apiManager;

  HomeRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, CategoryOrBrandResponseDto>> getAllCategories() async {
    return ApiHelper.safeApiCall(
      () => apiManager.get(EndPoints.categories),
      (data) => CategoryOrBrandResponseDto.fromJson(data),
    );
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseDto>> getAllBrands() async {
    return ApiHelper.safeApiCall(
      () => apiManager.get(EndPoints.brands),
      (data) => CategoryOrBrandResponseDto.fromJson(data),
    );
  }

}
