import 'package:dio/dio.dart';
import 'package:planet_app/shared/constants.dart';

class ApiServices {
  final Dio _dio;

  ApiServices(this._dio) {
    _dio.options = BaseOptions(
      baseUrl: kBaseUrl,
    );
  }

  Future<Response> post({
    required String endPoint,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    Object? data,
  }) async {
    Response response = await _dio.post(
      endPoint,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
      data: data,
    );
    return response;
  }
}
