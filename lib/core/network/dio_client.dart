import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as state;

class DioClient {
  final _dio = state.Get.find<Dio>();

  /// [POST]
  Future<Response<dynamic>> post({
    String path = '',
    String? token,
    String? contentType,
    Map<String, String>? headers,
    FormData? formData,
    Map<String, dynamic>? bodyRaw,
    Map<String, dynamic>? queryParameters,
  }) async {
    if (!await _checkInternetConnection()) {
      throw Exception(['NOT_INTERNET_EXCEPTION']);
    }
    interceptorHeader(headers: headers, token: token);
    final response = await _dio
        .post(path,
            data: bodyRaw ?? formData, //
            options: Options(method: 'POST', contentType: contentType),
            queryParameters: queryParameters)
        .catchError((error) {
      DioException dioError = error;
      if (dioError.response?.statusCode != 500) {
        // ignore: invalid_return_type_for_catch_error
        return dioError.response!;
      } else {
        throw Exception('SERVER_ERROR');
      }
    }).timeout(
      Duration(milliseconds: _dio.options.connectTimeout!.inMilliseconds),
      onTimeout: () {
        throw Exception(['TIME_OUT']);
      },
    );
    return response;
  }

  /// [PUT]
  Future<Response<dynamic>> put(
      {String path = '',
      String? token,
      Map<String, String>? headers,
      Map<String, dynamic>? bodyRaw,
      Map<String, dynamic>? queryParameters}) async {
    if (!await _checkInternetConnection()) {
      throw Exception(['NOT_INTERNET_EXCEPTION']);
    }
    interceptorHeader(headers: headers, token: token);
    final response = await _dio
        .put(path,
            data: bodyRaw,
            options: Options(method: 'PATCH'),
            queryParameters: queryParameters)
        .catchError((error) {
      DioException dioError = error;
      if (dioError.response?.statusCode != 500) {
        // ignore: invalid_return_type_for_catch_error
        return dioError.response!;
      } else {
        throw Exception('SERVER_ERROR');
      }
    }).timeout(
      Duration(milliseconds: _dio.options.connectTimeout!.inMilliseconds),
      onTimeout: () {
        throw Exception(['TIME_OUT']);
      },
    );
    return response;
  }

  /// [DELETE]
  Future<Response<dynamic>> delete(
      {String path = '',
      String? token,
      Map<String, String>? headers,
      Map<String, dynamic>? queryParameters}) async {
    if (!await _checkInternetConnection()) {
      throw Exception(['NOT_INTERNET_EXCEPTION']);
    }
    interceptorHeader(headers: headers, token: token);
    final response = await _dio
        .delete(path,
            options: Options(method: 'PATCH'), queryParameters: queryParameters)
        .catchError((error) {
      DioException dioError = error;
      if (dioError.response?.statusCode != 500) {
        // ignore: invalid_return_type_for_catch_error
        return dioError.response!;
      } else {
        throw Exception('SERVER_ERROR');
      }
    }).timeout(
      Duration(milliseconds: _dio.options.connectTimeout!.inMilliseconds),
      onTimeout: () {
        throw Exception(['TIME_OUT']);
      },
    );
    return response;
  }

  /// [GET]
  Future<Response<dynamic>> get({
    String path = '',
    String? token,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    ResponseType? responseType,
  }) async {
    if (!await _checkInternetConnection()) {
      throw Exception(['NOT_INTERNET_EXCEPTION']);
    }
    interceptorHeader(headers: headers, token: token);
    _dio.options.followRedirects = true;
    return _dio
        .get(
      path,
      options: Options(
          method: 'GET',
          responseType: responseType ?? ResponseType.json,
          headers: {
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Headers': 'Origin, Content-Type, Accept',
          }),
      queryParameters: queryParameters,
    )
        .then((Response response) {
      return response;
    }).catchError((error) {
      DioException dioError = error;
      if (dioError.response?.statusCode != 500) {
        // ignore: invalid_return_type_for_catch_error
        return dioError.response!;
      } else {
        throw Exception('SERVER_ERROR');
      }
    }).timeout(
            Duration(milliseconds: _dio.options.connectTimeout!.inMilliseconds),
            onTimeout: () {
      throw Exception(['TIME_OUT']);
    });
  }

  void interceptorHeader({
    Map<String, String>? headers,
    String? token,
  }) {
    if (headers != null) {
      _dio.options.headers.addAll(headers);
    }
    if (token != null) {
      _dio.options.headers.addAll({"Authorization": "Bearer $token"});
    } else {
      _dio.options.headers.remove("Authorization");
    }
  }

  Future<bool> _checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }
    return true;
  }
}
