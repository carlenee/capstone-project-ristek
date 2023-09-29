import 'package:dio/dio.dart';

import '../core/environments/endpoints.dart';
import 'shared_preferences.dart';

class HttpService {
  static final Dio _client = Dio();

  // set header
  static void setHeader(String key, String value) {
    _client.options.headers[key] = value;
  }

  static Dio get instance {
    _client.options = BaseOptions(
      baseUrl: Endpoints.baseUrl,
      receiveTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 6),
    );

    _client.options.validateStatus = (status) => true;
    return _client;
  }

  static Future<Map<String, String>?> getTokenHeader() async {
    final String? token = await SharedPreferencesService.getToken();

    if (token != null) {
      return {
        'Authorization': 'Bearer $token',
      };
    }
    return null;
  }

  static Future<Response> get(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await instance.get(
      url,
      options: Options(
        headers: headers ?? await getTokenHeader(),
      ),
      queryParameters: queryParameters,
    );
  }

  static Future<Response> post(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    dynamic body,
  }) async {
    return await instance.post(
      url,
      options: Options(
        headers: headers ?? await getTokenHeader(),
      ),
      queryParameters: queryParameters,
      data: body,
    );
  }

  static Future<Response> put(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    dynamic body,
  }) async {
    return await instance.put(
      url,
      options: Options(
        headers: headers ?? await getTokenHeader(),
      ),
      queryParameters: queryParameters,
      data: body,
    );
  }

  static Future<Response> patch(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    dynamic body,
  }) async {
    return await instance.patch(
      url,
      options: Options(
        headers: headers ?? await getTokenHeader(),
      ),
      queryParameters: queryParameters,
      data: body,
    );
  }

  static Future<Response> delete(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await instance.delete(
      url,
      options: Options(
        headers: headers ?? await getTokenHeader(),
      ),
      queryParameters: queryParameters,
    );
  }
}
