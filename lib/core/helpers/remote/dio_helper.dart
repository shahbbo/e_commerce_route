import 'package:dio/dio.dart';
import 'package:e_commerce_route/core/helpers/local/cache_helper.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../resources/constants_manager.dart';
import 'dio_interceptor.dart';

@singleton
class DioHelper {
  late Dio dio;

  DioHelper() {
    dio = Dio();
    dio.interceptors.add(DioInterceptor());
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        filter: (options, args) {
          if (options.path.contains('/posts')) return false;
          if (args.isResponse && args.hasUint8ListData) return false;
          return true;
        }
    )
    );
  }


  String? get token => CacheHelper.getData(key: 'token') as String?;

  Future<Response> get(String endPoint,
      {Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) {
    return dio.get(
      AppConstants.baseUrl + endPoint,
      queryParameters: queryParameters,
      options: Options(validateStatus: (status) => true, headers: {
        'token': token,
        ...?headers
      }),
    );
  }

  Future<Response> post(String endPoint,
      {Map<String, dynamic>? body, Map<String, dynamic>? headers}) {
    return dio.post(AppConstants.baseUrl + endPoint,
        data: body,
        options: Options(headers: {
          'token': token,
          ...?headers
        }, validateStatus: (status) => true));
  }

  Future<Response> delete(String endPoint,
      {Map<String, dynamic>? body, Map<String, dynamic>? headers}) {
    return dio.delete(AppConstants.baseUrl + endPoint,
        data: body,
        options: Options(headers: {
          'token': token
          ,...?headers
        }, validateStatus: (status) => true));
  }

  Future<Response> update(String endPoint,
      {Map<String, dynamic>? body, Map<String, dynamic>? headers}) {
    return dio.put(AppConstants.baseUrl + endPoint,
        data: body,
        options: Options(headers: {
          'token': token
          ,...?headers
        }, validateStatus: (status) => true));
  }
}
