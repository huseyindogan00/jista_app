import 'package:get/get.dart';
import 'package:jista/core/services/service/firebase_store_service.dart';
import 'package:jista/core/services/service_result/firebase_service_result_model.dart';
import 'package:jista/main.dart';
import 'package:jista/product/models/person/person_model.dart';
import 'package:jista/views/base/base_model.dart';

import '../../../product/models/product/product_model.dart';

class HomeViewModel extends BaseModel {
  static final _firebaseStorage = locator<FirebaseStoreService>();
  final productModel = Rxn<ProductModel>().obs;

  static Future<FirebaseServiceResultModel<List<ProductModel>>> getAllProduct() async {
    return await _firebaseStorage.getAllCategory('product');
  }

  RxInt categoryIndex = 0.obs;
  getCategory(int index) {
    categoryIndex.value = index;
  }
}
