import 'package:get/get.dart';
import 'package:jista/core/enums/view_state.dart';
import 'package:jista/core/services/service/firebase_store_service.dart';
import 'package:jista/core/services/service_result/firebase_service_result_model.dart';
import 'package:jista/main.dart';
import 'package:jista/product/models/product/product_model.dart';
import 'package:jista/views/base/base_model.dart';

class ServiceWearViewModel extends BaseModel {
  final FirebaseStoreService firebaseStoreService =
      locator<FirebaseStoreService>();

  Future<FirebaseServiceResultModel<List<ProductModel>>?> getToProduct(
      String productType) async {
    FirebaseServiceResultModel<List<ProductModel>>? resultService =
        FirebaseServiceResultModel(isSuccess: false);
    setViewState(ViewState.Busy);

    resultService = await firebaseStoreService.getToCategory(productType);
    resultService.isSuccess = true;
    setViewState(ViewState.Idle);
    return resultService;
  }

  var isWinter = false.obs;
  var isSummer = false.obs;
  var isAll = false.obs;
  var filterList = <String>{};

  setFilterColorState(bool value) {}
}
