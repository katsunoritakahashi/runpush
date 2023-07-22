import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ScheduleData {
  ScheduleData({
    required this.endAt,
    required this.characterId,
  });

  final RxString endAt;
  final RxInt characterId;
}
