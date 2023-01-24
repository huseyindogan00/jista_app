// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jista/core/services/service/base/i_firebase_store_service.dart';
import 'package:jista/core/services/service_result/firebase_service_result_model.dart';
import 'package:jista/core/services/service_result/base/service_result.dart';
import 'package:jista/product/models/address/address_model.dart';
import 'package:jista/product/models/order/order_model.dart';
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
    }

    return FirebaseServiceResultModel(isSuccess: false, dataInfo: error);
  }

  @override
  FirebaseServiceResultModel updateAddress(String personId, AddressModel addressModel) {
    try {
      Future<void> result = _firebaseFirestore
          .collection('person')
          .doc(personId)
          .collection('address')
          .doc(addressModel.id)
          .update(addressModel.toMap());
    } on FirebaseException catch (e) {
      return FirebaseServiceResultModel(isSuccess: false, dataInfo: e.message);
    }
    return FirebaseServiceResultModel(isSuccess: true, dataInfo: 'Kargo bilgileri güncellendi');
  }

  Future<FirebaseServiceResultModel> updatePerson(PersonModel personModel) async {
    try {
      Future<void> result = _firebaseFirestore.collection('person').doc(personModel.id).update(personModel.toMap());
    } on FirebaseException catch (e) {
      return FirebaseServiceResultModel(isSuccess: false, dataInfo: e.message);
    }
    return FirebaseServiceResultModel(isSuccess: true, dataInfo: 'Kullanıcı puanı güncellendi');
  }

  Future<FirebaseServiceResultModel> addOrderModel(PersonModel personModel, List<OrderModel> orderModelList) async {
    try {
      for (var order in orderModelList) {
        await _firebaseFirestore.collection('person').doc(personModel.id).collection('order').doc().set(order.toMap());
      }

      return FirebaseServiceResultModel(isSuccess: true, dataInfo: 'Sipariş Verildi');
    } on FirebaseException catch (e) {
      return FirebaseServiceResultModel(isSuccess: true, dataInfo: e.message);
    }
  }

  Future<FirebaseServiceResultModel> isThereProduct(String personId, String productId) async {
    try {
      QuerySnapshot<Map<String, dynamic>> result = await _firebaseFirestore
          .collection('person')
          .doc(personId)
          .collection('order')
          .where('productId', isEqualTo: productId)
          .get();

      if (result.docs.isNotEmpty) {
        return FirebaseServiceResultModel(isSuccess: true, dataInfo: 'Ürün mevcut');
      } else {
        return FirebaseServiceResultModel(isSuccess: false, dataInfo: 'Ürün mevcut değil');
      }
    } on FirebaseException catch (e) {
      return FirebaseServiceResultModel(isSuccess: false, dataInfo: e.message);
    }
  }

  Future<FirebaseServiceResultModel<List<OrderModel>>> getOrder(String year, String personelId) async {
    List<OrderModel> orderModelList = [];
    try {
      QuerySnapshot<Map<String, dynamic>> data =
          await _firebaseFirestore.collection('person').doc(personelId).collection('order').get();
      if (data.docs.isNotEmpty) {
        List<QueryDocumentSnapshot<Map<String, dynamic>>> queryList = data.docs;
        for (var queryDocument in queryList) {
          OrderModel orderModel = OrderModel.fromMap(queryDocument.data());
          orderModelList.add(orderModel);
        }
      } else {
        return FirebaseServiceResultModel(isSuccess: false, dataInfo: 'Sipariş bulunmamaktadır');
      }
    } on FirebaseException catch (e) {
      return FirebaseServiceResultModel(isSuccess: false, dataInfo: e.message);
    }
    return FirebaseServiceResultModel<List<OrderModel>>(isSuccess: true, data: orderModelList);
  }

  @override
  delete(PersonModel personModel) {}
}
