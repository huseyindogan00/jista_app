// ignore_for_file: must_be_immutable
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jista/core/init/app_init.dart';
import 'package:jista/core/services/service/hive_service.dart';
import 'package:jista/data/constant/appbar_text/appbar_title.dart';
import 'package:jista/product/models/order/order_model.dart';
import 'package:jista/product/models/person/person_model.dart';
import 'package:jista/product/models/product/product_model.dart';
import 'package:jista/product/widget/my_appbar_widget.dart';
import 'package:jista/product/widget/navigation_drawer_widget.dart';

class OrderView extends StatefulWidget {
  OrderView({@PathParam() required this.personModel, super.key}) {
    getPerson();
  }

  PersonModel? personModel;

  getPerson() async {
    personModel = await locator<HiveService>().getBoxPerson('person');
  }

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  PersonModel? personModel;

  @override
  void initState() {
    super.initState();
    personModel = widget.personModel;
    //personModel = widget.personModel as PersonModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbarWiget.createAppbar(title: AppbarTitle.orderPageTitle).getAppBar(context),
      drawer: NavigationDrawer(),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('person').doc(personModel!.id).collection('order').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text('Siparişler güncelleniyor..', style: TextStyle(color: Colors.black)));
          } else if (snapshot.data == null) {
            return const Center(child: Text('sipariş verilmemiş..', style: TextStyle(color: Colors.black)));
          } else {
            List<OrderModel> orderList = [];
            //Map<String, List<OrderModel>> orderMap = {};
            List<QueryDocumentSnapshot<Map<String, dynamic>>> data = snapshot.data!.docs;

            for (var order in data) {
              Map<String, dynamic> mapData = order.data();
              OrderModel orderModel = OrderModel.fromMap(mapData);
              orderModel.dateTime = _buildTimestampToDateTime(mapData['dateTime'] as Timestamp);

              orderList.add(orderModel);
            }

            return orderList.isEmpty
                ? const Center(
                    child: Text(
                    'Sipariş yok',
                    style: TextStyle(color: Colors.black),
                  ))
                : ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(height: 10),
                    itemCount: orderList.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      OrderModel order = orderList[index];
                      return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                        future: FirebaseFirestore.instance.collection('product').doc(order.productId).get(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Text('Bekleniyor');
                          } else {
                            Map<String, dynamic>? mapProduct = snapshot.data!.data();
                            ProductModel productModel = ProductModel.fromMap(mapProduct!);

                            return _buildProductCard(productModel, order);
                          }
                        },
                      );
                    },
                  );
          }
        },
      ),
    );
  }

  SizedBox _buildProductCard(ProductModel productModel, OrderModel order) {
    TextStyle titleTextStyle = TextStyle(color: Colors.grey.shade900);
    TextStyle subtitleTextStyle = TextStyle(color: Colors.grey.shade500);
    return SizedBox(
      height: 100,
      child: Card(
        color: Colors.white,
        child: ListTile(
            leading: SizedBox(
              width: 50,
              child: Image.network(productModel.imageUrl!, fit: BoxFit.contain),
            ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productModel.type, style: titleTextStyle, overflow: TextOverflow.fade),
                Text(productModel.title, style: subtitleTextStyle),
                Text(
                  'Sipariş Tarihi: ${_builDateTimeString(order.dateTime as DateTime)}',
                  style: subtitleTextStyle,
                ),
              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                productModel.cargoStatus
                    ? const Text('Kargo', style: TextStyle(color: Colors.cyan, fontSize: 17))
                    : const Text('Mutemetlik', style: TextStyle(color: Colors.orange, fontSize: 17)),
                Text(
                  'Hazırlanıyor...',
                  style: TextStyle(color: Colors.green.shade600),
                ),
              ],
            )),
      ),
    );
  }

  String _builDateTimeString(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  DateTime _buildTimestampToDateTime(Timestamp timestamp) =>
      DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch);
}
