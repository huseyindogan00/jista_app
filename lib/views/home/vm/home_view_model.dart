import 'package:jista/core/services/service/firebase_store_service.dart';
import 'package:jista/core/services/service_result/base/service_result.dart';
import 'package:jista/core/services/service_result/firebase_service_result_model.dart';
import 'package:jista/main.dart';
import 'package:jista/models/product/product_model.dart';

class HomeViewModel {
  static final _firebaseStorage = locator<FirebaseStoreService>();

  static Future<FirebaseServiceResultModel<List<ProductModel>>> getAllProduct() async {
    return await _firebaseStorage.read('product');
  }
}
