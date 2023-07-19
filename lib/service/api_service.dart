import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService extends GetConnect {
  String? token;

  // SharedPreferencesからトークンを取得
  _setToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? localToken = localStorage.getString('token');

    // なぜかlocalStorageから取得した値の前後に"が入るので仕方なくここで置換する
    if (localToken != null) {
      token = localToken.replaceAll('"', '');
    }
  }

  Future<Map<String, String>> makeAuthorizationBearerHeader() async {
    await _setToken();
    return {
      'Authorization': "Bearer $token",
    };
  }
}

class ApiException implements Exception {
  String message;

  ApiException(this.message);
}
