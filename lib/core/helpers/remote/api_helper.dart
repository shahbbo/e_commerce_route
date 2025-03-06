import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'failures.dart';

class ApiHelper {
  static Future<Either<Failures, T>> safeApiCall<T>(Future<Response> Function() request, T Function(dynamic data) fromJson,) async {
    var checkResult = await Connectivity().checkConnectivity();
    if (checkResult.contains(ConnectivityResult.none)) {
      return Left(NetworkError(errorMessage: 'No Internet Connection'));
    }
    try {
      final response = await request();
      if (response.statusCode != null) {
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(fromJson(response.data));
        } else {
          return Left(_handleHttpError(response));
        }
      } else {
        return Left(ServerError(errorMessage: 'Unknown Response Status'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  static Failures _handleHttpError(Response response) {
    switch (response.statusCode) {
      case 400:
        //Bad Request
        return ServerError(errorMessage: "${response.data['message']}");
      case 401:
        //Unauthorized
        return ServerError(errorMessage: "${response.data['message']}");
      case 403:
        //Forbidden
        return ServerError(errorMessage: "${response.data['message']}");
      case 404:
        //Not Found
        return ServerError(errorMessage: "${response.data['message']}");
      case 408:
        return ServerError(errorMessage: 'Request Timeout');
      case 409:
        //Conflict
        return ServerError(errorMessage: "${response.data['message']}");
      case 422:
        //Unprocessable Entity
        return ServerError(errorMessage: "${response.data['message']}");
      case 429:
        return ServerError(errorMessage: 'Too Many Requests');
      case 500:
        return ServerError(errorMessage: 'Internal Server Error');
      case 503:
        return ServerError(errorMessage: 'Service Unavailable');
      case 504:
        return ServerError(errorMessage: 'Gateway Timeout');
      default:
        return ServerError(errorMessage: 'Unexpected Error: ${response.statusCode}');
    }
  }

  static Failures _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerError(errorMessage: 'Connection Timeout');
      case DioExceptionType.sendTimeout:
        return ServerError(errorMessage: 'Send Timeout');
      case DioExceptionType.receiveTimeout:
        return ServerError(errorMessage: 'Receive Timeout');
      case DioExceptionType.badResponse:
        return ServerError(errorMessage: 'Bad Response: ${e.response?.statusCode}');
      case DioExceptionType.cancel:
        return ServerError(errorMessage: 'Request Cancelled');
      case DioExceptionType.connectionError:
        return NetworkError(errorMessage: 'No Internet Connection');
      default:
        return ServerError(errorMessage: 'Unknown Dio Error');
    }
  }

}
