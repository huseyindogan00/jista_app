import 'package:jista/core/services/service_result/base/service_result.dart';

class FirebaseServiceResultModel<T> implements ServiceResult<T> {
  @override
  String? dataInfo;

  @override
  bool isSuccess;

  @override
  T? data;

  String? userId;

  FirebaseServiceResultModel(
      {this.dataInfo, required this.isSuccess, this.userId, this.data});
}
