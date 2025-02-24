import 'dart:developer';

import 'package:food_order_app/parameters.dart';

void printLogs(message) {
  if (isDev) {
    log(message.toString());
  }
}