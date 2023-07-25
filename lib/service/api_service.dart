import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:runpush/model/user.dart';

class ApiService extends GetConnect {
  static const _commonHeaders = {
    'content-type': 'application/json',
  };

  Uri _makeUri(String path, {Map<String, String?>? queryParams}) {
    final apiPath = "/api$path";
    return Uri.https('runpush-5f3841365808.herokuapp.com', apiPath, queryParams);
  }

  bool _checkStatusCode(http.Response response) {
    final statusCode = response.statusCode;
    if (statusCode >= 200 && statusCode < 300) {
      return true;
    } else if (statusCode == 404) {
      throw ApiException('データがありません');
    } else if (statusCode == 401) {
      final body = json.decode(response.body);
      throw ApiException(body['errorMessage'] ?? '認証できませんでした');
    } else if (statusCode == 422) {
      throw ApiException('サーバーが集中しております');
    } else if (statusCode == 500) {
      return false;
    } else {
      return false;
    }
  }

  Map<String, dynamic> _decodeResponse<T>(http.Response response) {
    _checkStatusCode(response);
    return json.decode(response.body);
  }

  // ユーザー取得API
  Future<User> getUser(UserData userData) async {
    final res = await http.post(
      _makeUri('/register-user'),
      headers: _commonHeaders,
      body: jsonEncode({
        'uid': userData.uid(),
        'deviceToken': userData.deviceToken(),
        'characterId': userData.characterId(),
        'endAt': userData.endAt(),
      }),
    );
    final dynamic data = _decodeResponse(res)['data'];
    return User.fromJson(data);
  }

  // ユーザー登録API
  Future<bool> registerUser(UserData userData) async {
    final res = await http.post(
      _makeUri('/register-user'),
      headers: _commonHeaders,
      body: jsonEncode({
        'uid': userData.uid(),
        'deviceToken': userData.deviceToken(),
        'characterId': userData.characterId(),
        'endAt': userData.endAt(),
      }),
    );
    return _checkStatusCode(res);
  }
}

class ApiException implements Exception {
  String message;

  ApiException(this.message);
}
