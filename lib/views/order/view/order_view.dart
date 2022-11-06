import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jista/data/constant/appbar_text/appbar_title.dart';
import 'package:jista/product/widget/my_appbar_widget.dart';
import 'package:jista/product/widget/navigation_drawer_widget.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbarWiget.createAppbar(title: AppbarTitle.orderPageTitle).getAppBar(context),
      drawer: NavigationDrawer(),
      /* body: StreamBuilder(
        stream: ,
        builder: (context, snapshot) {
        
      },), */
    );
  }
}
