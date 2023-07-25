import 'package:get/get_rx/src/rx_types/rx_types.dart';

class User {
  User({
    required this.uid,
    required this.deviceToken,
    required this.endAt,
    required this.characterId,
  });

  final String uid;
  final String deviceToken;
  final String endAt;
  final int characterId;

  static User fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'],
      deviceToken: json['deviceToken'],
      endAt: json['endAt'],
      characterId: json['characterId'],
    );
  }
}

class UserData {
  UserData({
    required this.uid,
    required this.deviceToken,
    required this.endAt,
    required this.characterId,
  });

  final RxString uid;
  final RxString deviceToken;
  final RxString endAt;
  final RxInt characterId;
}
