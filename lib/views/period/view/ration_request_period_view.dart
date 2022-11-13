import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jista/core/enums/view_state.dart';
import 'package:jista/core/services/service/hive_service.dart';
import 'package:jista/data/constant/appbar_text/appbar_title.dart';
import 'package:jista/main.dart';
import 'package:jista/product/models/order/order_model.dart';
import 'package:jista/product/widget/my_appbar_widget.dart';
import 'package:jista/product/widget/navigation_drawer_widget.dart';
import 'package:jista/views/base/base_model.dart';
import 'package:jista/views/period/view_model/ration_request_period_view_model.dart';

class RationRequestPeriodView extends StatefulWidget {
  RationRequestPeriodView({super.key});

  @override
  State<RationRequestPeriodView> createState() => _RationRequestPeriodViewState();
}

class _RationRequestPeriodViewState extends State<RationRequestPeriodView> {
  final controllerViewModel = Get.put(RationRequestPeriodViewModel());
  final hiveService = locator<HiveService>();
  final basemodelController = Get.put(BaseModel());
  String? personelId;

  String? selectedValue;

  @override
  void initState() {
    super.initState();
    getPersonelId();
  }

  getPersonelId() async {
    personelId = await hiveService.getBoxPersonId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbarWiget.createAppbar(title: AppbarTitle.periodPageTitle).getAppBar(context),
      drawer: NavigationDrawer(),
      body: Column(
        children: [
          Container(
            height: 60,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(blurRadius: 5, color: Colors.amber.shade100, blurStyle: BlurStyle.inner),
            ]),
            width: double.infinity,
            child: DropdownButton<String>(
              menuMaxHeight: 250,
              dropdownColor: Colors.amber.shade200,
              itemHeight: 50,
              hint: const Text('İstek dönemine ait yılı seçiniz.'),
              isExpanded: true,
              alignment: Alignment.center,
              value: selectedValue,
              style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
              items: yearList.map((year) {
                return DropdownMenuItem<String>(
                  alignment: Alignment.center,
                  value: year,
                  child: Text(year),
                );
              }).toList(),
              onChanged: (value) async {
                print('değer geldi $value');
                await controllerViewModel.getOrtder(value!.split(' ').first, personelId!);
                print('değer değişti');
                setState(() {
                  selectedValue = value;
                });
              },
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Obx(
              () => controllerViewModel.orderModelList.value.isEmpty
                  ? const Center(
                      child: Text(
                        'Sipariş Listesi boş',
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  : controllerViewModel.viewState == ViewState.BUSY
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Colors.amber.shade500,
                          ),
                        )
                      : ListView.builder(
                          itemCount: controllerViewModel.orderModelList.value.length,
                          itemBuilder: (context, index) {
                            OrderModel orderModel = controllerViewModel.orderModelList.value[index];
                            return Card(
                              child: ListTile(
                                leading: Text(orderModel.count.toString(), style: TextStyle(color: Colors.black)),
                                title: Text(orderModel.dateTime.toString(), style: TextStyle(color: Colors.black)),
                                trailing:
                                    Text(orderModel.cargo ? 'Kargo' : 'Sevk', style: TextStyle(color: Colors.black)),
                              ),
                            );
                          },
                        ),
            ),
          )
        ],
      ),
    );
  }
}

List<String> yearList = [
  '2010 Dönemi',
  '2011 Dönemi',
  '2012 Dönemi',
  '2013 Dönemi',
  '2014 Dönemi',
  '2015 Dönemi',
  '2016 Dönemi',
  '2017 Dönemi',
  '2018 Dönemi',
  '2019 Dönemi',
  '2020 Dönemi',
  '2021 Dönemi',
  '2022 Dönemi',
];
