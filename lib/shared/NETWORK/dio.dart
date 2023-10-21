import 'package:dio/dio.dart';
import 'package:online_store/shared/components/components.dart';
import 'package:online_store/shared/components/constans/constans.dart';

class DioHelr {
  static Dio dio = Dio(BaseOptions(
    baseUrl: 'https://student.valuxapps.com/api/',
    receiveDataWhenStatusError: true,
  ));

  static Future<Response> get({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'ar',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': selectedDialogLanguage.isoCode.toString().toString(),
      'Authorization': token ?? '',
    };
    return await dio.get(url, queryParameters: query ?? null);
  }

  static Future<Response> postdata({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'ar',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': selectedDialogLanguage.isoCode.toString().toString(),
      'Authorization': token
    };

    return await dio.post(url, queryParameters: query, data: data);
  }

  static Future<Response> putdata({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'ar',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': selectedDialogLanguage.isoCode.toString().toString(),
      'Authorization': token
    };

    return await dio.put(url, queryParameters: query, data: data);
  }
}
