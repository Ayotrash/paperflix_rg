import 'package:dio/dio.dart';
import 'package:paperflix_rg/config/config.dart';

class Providers {
  static Future register(
      {String firstname,
      String lastname,
      String email,
      String password,
      String avatar,
      String gender,
      Map deviceInfo}) async {
    return Dio().post('$HOST/v1_auth/register',
        data: {
          "firstname": firstname,
          "lastname": lastname,
          "email": email,
          "password": password,
          "avatar": avatar,
          "gender": gender,
          "deviceInfo": deviceInfo,
        },
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status < 500;
            }));
  }
}
