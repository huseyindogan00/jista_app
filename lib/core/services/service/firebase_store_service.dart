import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jista/core/services/service/base/i_firebase_store_service.dart';
import 'package:jista/core/services/service_result/firebase_service_result_model.dart';
import 'package:jista/core/services/service_result/base/service_result.dart';
import '../../../product/models/person/person_model.dart';
import '../../../product/models/product/product_model.dart';

class FirebaseStoreService implements IFirebaseStoreService {
  static final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<FirebaseServiceResultModel<List<ProductModel>>> getFilterProducts(String season, String typeName) async {
    List<ProductModel> productList = [];
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await _firebaseFirestore
          .collection('product')
          .where('season', isEqualTo: season)
          .where('type', isEqualTo: typeName)
          .get();

      if (snapshot.docs.isNotEmpty) {
        for (QueryDocumentSnapshot<Map<String, dynamic>> doc in snapshot.docs) {
          Map<String, dynamic> product = doc.data();
          product['id'] = doc.id;
          ProductModel productModel = ProductModel.fromMap(product);
          productList.add(productModel);
        }
        ProductModel.productList = productList;
        return FirebaseServiceResultModel(isSuccess: true, data: productList);
      }
    } on FirebaseException catch (_) {}

    return FirebaseServiceResultModel(isSuccess: false, dataInfo: 'Product çekilemedi');
  }

  @override
  Future<FirebaseServiceResultModel<List<ProductModel>>> getAllProduct(String typeName) async {
    List<ProductModel> productList = [];

    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await _firebaseFirestore.collection('product').where('type', isEqualTo: typeName).get();

      if (snapshot.docs.isNotEmpty) {
        for (QueryDocumentSnapshot<Map<String, dynamic>> doc in snapshot.docs) {
          Map<String, dynamic> product = doc.data();
          product['id'] = doc.id;
          ProductModel productModel = ProductModel.fromMap(product);
          productList.add(productModel);
        }
        ProductModel.productList = productList;
        return FirebaseServiceResultModel(isSuccess: true, data: productList, dataInfo: 'Başarılı');
      }
    } on FirebaseException catch (e) {
      return FirebaseServiceResultModel(isSuccess: false, dataInfo: e.message.toString());
    }
    return FirebaseServiceResultModel(isSuccess: false, dataInfo: 'Product çekilemedi');
  }

  @override
  void create(PersonModel personModel) {
    _firebaseFirestore.collection('person').doc().set(personModel.toMap());
  }

  @override
  Future<ServiceResult<PersonModel>> loginControl(PersonModel personModel) async {
    //QuerySnapshot<Map<String, dynamic>> snapshot = await _firebaseFirestore.collection('person').where('pbik',isEqualTo: userModel.pbik).get();
    late PersonModel person;
    String error = '';
    Map<String, dynamic>? addressMap;
    Map<String, dynamic>? personMap;

    try {
      QuerySnapshot<Map<String, dynamic>> personSnapshot =
          await _firebaseFirestore.collection('person').where('pbik', isEqualTo: personModel.pbik).get();

      if (personSnapshot.docs.isNotEmpty) {
        DocumentSnapshot<Map<String, dynamic>> personDocument = personSnapshot.docs.first;
        if (personDocument.exists) {
          personMap = personDocument.data();

          QuerySnapshot<Map<String, dynamic>> addressSnapshot =
              await _firebaseFirestore.collection('person').doc(personDocument.id).collection('address').get();

          if (addressSnapshot.docs.isNotEmpty && addressSnapshot.docs.first.exists) {
            addressMap = addressSnapshot.docs.first.data();
            addressMap['id'] = addressSnapshot.docs.first.id;
          }
          personMap?['id'] = personDocument.id;

          if (personMap != null) {
            personMap['address'] = addressMap;
            person = PersonModel.fromMap(personMap);
            return FirebaseServiceResultModel(isSuccess: true, data: person);
          }
        }
      }
      return FirebaseServiceResultModel(isSuccess: false, dataInfo: 'Pbik numarası veritabınında yok');
    } on FirebaseException catch (e) {
      error = e.message.toString();
      print(e.stackTrace);
    }

    return FirebaseServiceResultModel(isSuccess: false, dataInfo: error);
  }

  @override
  update(PersonModel personModel) {}
  @override
  delete(PersonModel personModel) {}
}
