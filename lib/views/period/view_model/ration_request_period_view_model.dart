// ignore_for_file: invalid_use_of_protected_member

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:jista/core/enums/view_state.dart';
import 'package:jista/core/init/app_init.dart';
import 'package:jista/core/services/service/firebase_store_service.dart';
import 'package:jista/core/services/service_result/firebase_service_result_model.dart';
import 'package:jista/main.dart';
import 'package:jista/product/models/order/order_model.dart';
import 'package:jista/views/base/base_model.dart';

class RationRequestPeriodViewModel extends BaseModel {
  static final _firebaseStorageService = locator<FirebaseStoreService>();
  var orderModelList = <OrderModel>[].obs;

  getOrtder(String year, String personelId) async {
    setViewState(ViewState.BUSY);
    orderModelList.clear();
    FirebaseServiceResultModel<List<OrderModel>> result = await _firebaseStorageService.getOrder(year, personelId);

    if (result.data != null || result.data!.isNotEmpty) {
      for (var orderModel in result.data!) {
        orderModel.dateTime = _buildTimestampToDateTime(orderModel.dateTime);
        if ((orderModel.dateTime as DateTime).year.toString() == year) {
          orderModelList.value.add(orderModel);
        }
      }
    }
    setViewState(ViewState.IDLE);
  }
}

DateTime _buildTimestampToDateTime(Timestamp timestamp) =>
    DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch);
