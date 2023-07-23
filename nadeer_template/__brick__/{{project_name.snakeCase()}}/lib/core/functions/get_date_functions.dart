import 'package:easy_localization/easy_localization.dart';

String getDate({String? date}) => date == null
    ? ""
    : DateFormat('dd-MM-y', 'en_US').format(DateTime.parse(date));
