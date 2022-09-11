import 'package:flutter/foundation.dart';

abstract class ServiceResult<T> {
  String? dataInfo;
  bool isSuccess = false;
}
