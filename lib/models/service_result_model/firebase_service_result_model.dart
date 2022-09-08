import 'package:jista/models/base/service_result.dart';

class FirebaseServiceResultModel implements ServiceResult {
  @override
  String? dataInfo;

  @override
  bool isSuccess;

  FirebaseServiceResultModel({this.dataInfo, required this.isSuccess});
}
