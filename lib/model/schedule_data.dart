import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ScheduleData {
  ScheduleData({
    required this.startAt,
    required this.endAt,
    required this.interval,
  });

  final RxString startAt;
  final RxString endAt;
  final RxInt interval;
}
