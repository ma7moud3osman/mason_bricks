import 'package:easy_localization/easy_localization.dart';

String greeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'good_morning'.tr();
  }
  if (hour < 17) {
    return 'good_afternoon'.tr();
  }
  return 'good_evening'.tr();
}