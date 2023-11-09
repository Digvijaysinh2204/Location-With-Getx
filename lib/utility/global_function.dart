import 'dart:developer';

import 'package:flutter/foundation.dart';

void kLog({title, required content}) {
  if (kDebugMode) {
    log(content.toString(), name: title ?? "");
  }
}
