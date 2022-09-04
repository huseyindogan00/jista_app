import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItem(context),
            ],
          ),
        ),
      );
}

Widget buildHeader(BuildContext context) {
  return Container(
    color: Theme.of(context).primaryColor.withOpacity(0.8),
    padding: EdgeInsets.only(
      top: 24 + MediaQuery.of(context).padding.top,
      bottom: 24,
    ),
    child: Column(
      children: const [
        CircleAvatar(
          radius: 52,
          backgroundImage: AssetImage('assets/images/person.png'),
        ),
        SizedBox(height: 12),
        Text(
          'Hüseyin DOĞAN',
          style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Text(
          'J.Mu.Asb.Kd.Çvş.',
          style: TextStyle(fontSize: 16, color: Colors.white, fontStyle: FontStyle.italic),
        ),
        Text(
          'MEBS İşlt. ve Emn.Asb.',
          style: TextStyle(fontSize: 16, color: Colors.white, fontStyle: FontStyle.italic),
        ),
      ],
    ),
  );
}

Widget buildMenuItem(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(24),
    child: Wrap(
      runSpacing: 16,
      children: [
        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text('Anasayfa'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.align_horizontal_left_outlined),
          title: const Text('Kategoriler'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.info_outlined),
          title: const Text('Kargo Bilgileri'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.add_shopping_cart_sharp),
          title: const Text('Sepet'),
          onTap: () {},
        ),
      ],
    ),
  );
}
