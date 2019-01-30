import 'package:dio/dio.dart';

import 'package:f_max_client/model/entities.dart';

const BASE_URL = ''; // base url
const USER_AUTH_HASH = ''; // user BASE64 hash

const CONNECT_TIMEOUT = 10 * 60 * 1000;
const RECEIVE_TIMEOUT = 10 * 60 * 1000;

class Api {
  static Api _api;

  static Api get() {
    if (_api == null) {
      _api = Api();
    }

    return _api;
  }

  Dio dio = Dio(
      Options(baseUrl: BASE_URL, headers: {
          'Authorization': 'Basic $USER_AUTH_HASH'
        }
      )
  );

  void logIn() async {

    try {
      final Response response = await dio.post(
        '/oslc/login',
      );

      print(response.statusCode);
      print(response.headers['set-cookie'][0]);

    } catch(ex) {
      print(ex);
    }
  }

  void whoAmI() async {

    try {
      final Response response = await dio.get(
          '/oslc/whoami'
      );

      print(response.statusCode);
      print(response.data.toString());

    } catch(ex) {
      print(ex);
    }
  }

  Future<Info> info(int lean, String select, String where) async {
    try {
      final Response response = await dio.get(
          '/oslc/os/work_task_mobile',
          data: { 'lean': lean, 'oslc.select': select, 'oslc.where': where }
      );

      print(response.statusCode);
      print(response.data.toString());

      return Info.fromJson(response.data);

    } catch(ex) {
      print(ex);

      return null;
    }
  }

  void getRequest(String fullUrl) async {
    final Dio d = Dio(Options(baseUrl: BASE_URL, headers: {
      'Authorization': 'Basic $USER_AUTH_HASH'
      },
      connectTimeout: CONNECT_TIMEOUT,
      receiveTimeout: RECEIVE_TIMEOUT)
    );

    try {
      final Response response = await d.get(fullUrl);

      print(response.statusCode);
      print(response.data.toString());

    } catch(ex) {
      print(ex);
    }
  }

}