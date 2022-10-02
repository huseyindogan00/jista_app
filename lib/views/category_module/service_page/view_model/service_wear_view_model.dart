import 'package:get/get.dart';
import 'package:jista/core/enums/view_state.dart';
import 'package:jista/core/services/service/firebase_store_service.dart';
import 'package:jista/core/services/service_result/firebase_service_result_model.dart';
import 'package:jista/data/constant/type/type_name.dart';
import 'package:jista/main.dart';
import 'package:jista/product/models/product/product_model.dart';
import 'package:jista/views/base/base_model.dart';

class ServiceWearViewModel extends BaseModel {
  final FirebaseStoreService firebaseStoreService = locator<FirebaseStoreService>();

  //final productModel = Rxn<ProductModel>().obs;
  Future<List<ProductModel>?> getToProduct(String productType) async {
    setViewState(ViewState.Busy);
    FirebaseServiceResultModel<List<ProductModel>> resultService =
        await firebaseStoreService.getToCategory(TypeName.egitimGiyecegi);
    setViewState(ViewState.Idle);
    return resultService.data;
  }

  var isWinter = false.obs;
  var isSummer = false.obs;
  var isAll = false.obs;
  filter(List<String> seasonKeys) {}

  setFilterColor(bool value) {}
}
