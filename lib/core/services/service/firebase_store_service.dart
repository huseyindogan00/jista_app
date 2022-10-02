import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:jista/core/services/service/base/i_firebase_store_service.dart';
import 'package:jista/core/services/service_result/firebase_service_result_model.dart';
import 'package:jista/core/services/service_result/base/service_result.dart';
import 'package:jista/data/constant/type/type_name.dart';
import '../../../product/models/person/person_model.dart';
import '../../../product/models/product/product_model.dart';

class FirebaseStoreService implements IFirebaseStoreService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<FirebaseServiceResultModel<List<ProductModel>>> getAllCategory(String collectionName) async {
    List<ProductModel> productList = [];
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await _firebaseFirestore.collection(collectionName).get();
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
  Future<FirebaseServiceResultModel<List<ProductModel>>> getToCategory(String type) async {
    List<ProductModel> productList = [];

    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await _firebaseFirestore.collection('product').where('type', isEqualTo: type).get();

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
    } on FirebaseException catch (_) {}
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

    try {
      QuerySnapshot<Map<String, dynamic>> personSnapshot =
          await _firebaseFirestore.collection('person').where('pbik', isEqualTo: personModel.pbik).get();

      if (personSnapshot.docs.isNotEmpty) {
        DocumentSnapshot<Map<String, dynamic>> personDoc = personSnapshot.docs.first;
        if (personDoc.exists) {
          Map<String, dynamic>? personMap = personDoc.data();

          QuerySnapshot<Map<String, dynamic>> addressSnapshot =
              await _firebaseFirestore.collection('person').doc(personDoc.id).collection('address').get();

          Map<String, dynamic> address = addressSnapshot.docs.first.data();

          personMap?['id'] = personDoc.id;
          address['id'] = addressSnapshot.docs.first.id;

          if (personMap != null) {
            personMap['address'] = address;
            person = PersonModel.fromMap(personMap);
            return FirebaseServiceResultModel(isSuccess: true, data: person);
          }
        }
      }
      return FirebaseServiceResultModel(isSuccess: false, dataInfo: 'Pbik numarası veritabınında yok');
    } catch (_) {
      print('FİRESERVİCE DE hata oluştu');
    }

    return FirebaseServiceResultModel(isSuccess: false, dataInfo: 'Giriş işlemi başarısız');

    // PERSON LİSTESİNİ GETİRME
    /* QuerySnapshot<Map<String, dynamic>> snapshot = await _firebaseFirestore.collection('person').get();  

    if (snapshot.docs.isNotEmpty) {
      for (DocumentSnapshot<Map<String, dynamic>> doc in snapshot.docs) {

        Map<String, dynamic>? personMap = doc.data();

        personMap?['id'] = doc.id;
        if (personMap != null) {
          PersonModel personModel = PersonModel.fromMap(personMap);
          personModelList.add(personModel);
        }
      }
    } 
    return FirebaseServiceResultModel<List<PersonModel>>(isSuccess: true, data: personModelList,dataInfo: 'Login oldu');
    */
  }

  @override
  update(PersonModel personModel) {}
  @override
  delete(PersonModel personModel) {}

  /* Future<FirebaseServiceResultModel<List<ProductModel>>> getAllProductFilter(List<String> filters,String type){
     List<ProductModel> productList = [];
    try {
      _firebaseFirestore.collection('product').where(type,isEqualTo: type).where()

    } catch (_) {
      
    }
  } */
}
