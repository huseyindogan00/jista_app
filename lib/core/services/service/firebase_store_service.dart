import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:jista/core/services/service/base/i_firebase_store_service.dart';
import 'package:jista/core/services/service_result/firebase_service_result_model.dart';
import 'package:jista/core/services/service_result/base/service_result.dart';
import '../../../product/models/person/person_model.dart';
import '../../../product/models/product/product_model.dart';

class FirebaseStoreService implements IFirebaseStoreService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  update(PersonModel personModel) {}
  @override
  delete(PersonModel personModel) {}

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
  create(PersonModel personModel) {
    _firebaseFirestore.collection('person').doc().set(personModel.toMap());
  }

  @override
  Future<ServiceResult<List<PersonModel>>> login(PersonModel personModel) async {
    //QuerySnapshot<Map<String, dynamic>> snapshot = await _firebaseFirestore.collection('person').where('pbik',isEqualTo: userModel.pbik).get();
    List<PersonModel> personModelList = [];

    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await _firebaseFirestore.collection('person').where('pbik', isEqualTo: personModel.pbik).get();

      if (snapshot.docs.isNotEmpty) {
        DocumentSnapshot<Map<String, dynamic>> doc = snapshot.docs.first;
        if (doc.exists) {
          Map<String, dynamic>? personMap = doc.data();

          QuerySnapshot<Map<String, dynamic>> addressSnapshot =
              await _firebaseFirestore.collection('person').doc(doc.id).collection('address').get();
          Map<String, dynamic> address = addressSnapshot.docs.first.data();

          personMap?['id'] = doc.id;
          address['id'] = addressSnapshot.docs.first.id;

          if (personMap != null) {
            personMap['address'] = address;
            personModelList.add(PersonModel.fromMap(personMap));
            return FirebaseServiceResultModel(isSuccess: true, data: personModelList);
          }
        }
      }
      return FirebaseServiceResultModel(
          isSuccess: false, data: personModelList, dataInfo: 'Pbik numarası veritabınında yok');
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
