import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:jista/core/services/service/base/i_firebase_store_service.dart';
import 'package:jista/core/services/service_result/firebase_service_result_model.dart';
import 'package:jista/core/services/service_result/base/service_result.dart';
import 'package:jista/models/person/person_model.dart';
import 'package:jista/models/product/product_model.dart';
import 'package:jista/models/user/user_model.dart';

class FirebaseStoreService implements IFirebaseStoreService {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  update(userModel) {}
  @override
  delete(model) {}

  @override
  Future<FirebaseServiceResultModel<List<ProductModel>>> read(String collectionName) async {
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
        return FirebaseServiceResultModel(isSuccess: true, data: productList);
      }
    } on FirebaseException catch (_) {}

    return FirebaseServiceResultModel(isSuccess: false, dataInfo: 'Product çekilemedi');
  }

  @override
  create(UserModel userModel) {
    _firebaseFirestore.collection('person').doc().set(userModel.toMap());
  }

  @override
  Future<ServiceResult> login(UserModel userModel) async {
    //QuerySnapshot<Map<String, dynamic>> snapshot = await _firebaseFirestore.collection('person').where('pbik',isEqualTo: userModel.pbik).get();
    List<PersonModel> personModelList = [];

    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await _firebaseFirestore.collection('person').where('pbik', isEqualTo: userModel.pbik).get();

      if (snapshot.docs.isNotEmpty) {
        DocumentSnapshot<Map<String, dynamic>> doc = snapshot.docs.first;
        if (doc.exists) {
          Map<String, dynamic>? personMap = doc.data();
          personMap?['id'] = doc.id;
          if (personMap != null) {
            personModelList.add(PersonModel.fromMap(personMap));
          }
        }
      }

      return FirebaseServiceResultModel(isSuccess: true, data: personModelList);
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
}
