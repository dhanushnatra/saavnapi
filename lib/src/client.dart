import 'package:dio/dio.dart';
import 'dart:convert';

abstract class BaseClient {
  final BaseOptions? options;
  final Dio dio;
  BaseClient([this.options])
    : dio = Dio(
        options ??
            BaseOptions(
              baseUrl: 'https://www.jiosaavn.com/api.php',
              queryParameters: {
                'api_version': '4',
                '_format': 'json',
                '_marker': '0',
                'ctx': 'wap6dot0',
              },
              responseType: ResponseType.json,
            ),
      );

  Future<Map<String, dynamic>> request({
    required String call,
    String language = 'english',
    Map<String, dynamic>? params,
  }) async {
    final res = await dio.get(
      "/",
      queryParameters: {
        "__call": call,
        "entity_language": language,
        ...?params,
      },
      options: Options(
        headers: {
          "cookie":
              'L=${Uri.encodeComponent(language)}; gdpr_acceptance=true; DL=english',
        },
      ),
    );

    return jsonDecode(res.data.toString()) as Map<String, dynamic>;
  }

  Future<List<dynamic>> requestlist({
    required String call,
    String language = 'telugu',
    Map<String, dynamic>? params,
  }) async {
    final res = await dio.get(
      "/",
      queryParameters: {
        "__call": call,
        "entity_language": language,
        ...?params,
      },
      options: Options(
        headers: {
          "cookie":
              'L=${Uri.encodeComponent(language)}; gdpr_acceptance=true; DL=english',
        },
      ),
    );

    return jsonDecode(res.data.toString()) as List<dynamic>;
  }
}
