import 'package:get/get.dart';
import 'package:jista/core/enums/view_state.dart';
import 'package:jista/core/init/app_init.dart';
import 'package:jista/core/services/service/firebase_store_service.dart';
import 'package:jista/core/services/service_result/firebase_service_result_model.dart';
import 'package:jista/main.dart';
import 'package:jista/product/models/product/product_model.dart';
import 'package:jista/views/base/base_model.dart';

class ProductViewModel extends BaseModel {
  final FirebaseStoreService _firebaseStoreService = locator<FirebaseStoreService>();
  var isWinter = false.obs;
  var isSummer = false.obs;
  var isAll = false.obs;
  var seasonFilter = 'HEPSİ';
  var count = 1.obs;
  var size = ''.obs;

  // ÜRÜN LİSTESİNİN DEĞİŞİMİNİ GÜNCELLEME
  //--------------------------------------------------
  var serviceResultModel = FirebaseServiceResultModel<List<ProductModel>>(isSuccess: false).obs;

  //Verilen product tipine göre product listesini çeker
  Future<FirebaseServiceResultModel<List<ProductModel>>?> getAllProduct(String productType) async {
    setViewState(ViewState.BUSY);
    FirebaseServiceResultModel<List<ProductModel>>? resultService =
        await _firebaseStoreService.getAllProduct(productType);
    setViewState(ViewState.IDLE);
    return resultService;
  }

  Future<FirebaseServiceResultModel<List<ProductModel>>?> getFilterProducts(String seasonName, String typeName) async {
    setViewState(ViewState.BUSY);
    FirebaseServiceResultModel<List<ProductModel>>? resultService =
        await _firebaseStoreService.getFilterProducts(seasonFilter, typeName);
    setViewState(ViewState.IDLE);

    return resultService;
  }
}
