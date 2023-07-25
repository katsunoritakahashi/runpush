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
    } else {
      return false;
    }
  }

  Map<String, dynamic> _decodeResponse<T>(http.Response response) {
    _checkStatusCode(response);
    return json.decode(response.body);
  }

  // ユーザー有無確認API
  Future<bool> judgeUser({required String uid}) async {
    final res = await http.post(
      _makeUri('/register-user/$uid'),
      headers: _commonHeaders,
    );
    return _checkStatusCode(res);
  }

  // ユーザー取得API
  Future<User> getUser({required String uid}) async {
    final res = await http.post(
      _makeUri('/register-user/$uid'),
      headers: _commonHeaders,
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
