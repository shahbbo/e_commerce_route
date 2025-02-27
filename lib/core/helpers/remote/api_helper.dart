import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'failures.dart';

class ApiHelper {
  static Future<Either<Failures, T>> safeApiCall<T>(Future<Response> Function() request, T Function(dynamic data) fromJson,) async {
    var checkResult = await Connectivity().checkConnectivity();
    if (checkResult == ConnectivityResult.none) {
      return Left(NetworkError(errorMessage: "No Internet Connection"));
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
        return Left(ServerError(errorMessage: "Unknown Response Status"));
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
        return ServerError(errorMessage: "Bad Request: ${response.data}");
      case 401:
        return ServerError(errorMessage: "Unauthorized: ${response.data}");
      case 403:
        return ServerError(errorMessage: "Forbidden: ${response.data}");
      case 404:
        return ServerError(errorMessage: "Not Found: ${response.data}");
      case 500:
        return ServerError(errorMessage: "Internal Server Error");
      default:
        return ServerError(errorMessage: "Unexpected Error: ${response.statusCode}");
    }
  }

  static Failures _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerError(errorMessage: "Connection Timeout");
      case DioExceptionType.sendTimeout:
        return ServerError(errorMessage: "Send Timeout");
      case DioExceptionType.receiveTimeout:
        return ServerError(errorMessage: "Receive Timeout");
      case DioExceptionType.badResponse:
        return ServerError(errorMessage: "Bad Response: ${e.response?.statusCode}");
      case DioExceptionType.cancel:
        return ServerError(errorMessage: "Request Cancelled");
      case DioExceptionType.connectionError:
        return NetworkError(errorMessage: "No Internet Connection");
      default:
        return ServerError(errorMessage: "Unknown Dio Error");
    }
  }

  static Future<Either<Failures, T>> safeApiCallWithInterceptor<T>(Future<Response> Function() apiCall, T Function(dynamic) fromJson,) async {
    try {
      var response = await apiCall();
      return Right(fromJson(response.data));
    } on DioException catch (e) {
      return Left(Failures(errorMessage: e.message ?? "Unknown Error"));
    }
  }
}
