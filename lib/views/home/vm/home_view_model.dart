import 'package:get/get.dart';
import 'package:jista/core/services/service/firebase_store_service.dart';
import 'package:jista/core/services/service_result/base/service_result.dart';
import 'package:jista/core/services/service_result/firebase_service_result_model.dart';
import 'package:jista/main.dart';

import '../../../product/models/product/product_model.dart';

class HomeViewModel extends GetxController {
  static final _firebaseStorage = locator<FirebaseStoreService>();

  RxInt categoryIndex = 0.obs;

  static Future<FirebaseServiceResultModel<List<ProductModel>>> getAllProduct() async {
    return await _firebaseStorage.read('product');
  }

  getCategory(int index) {
    categoryIndex.value = index;
  }
}
