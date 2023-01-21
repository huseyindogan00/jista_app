import 'package:flutter/material.dart';

class TrusteeView extends StatefulWidget {
  TrusteeView({super.key});

  @override
  State<TrusteeView> createState() => _TrusteeViewState();
}

class _TrusteeViewState extends State<TrusteeView> {
  DateTime? timeForTrustee = DateTime.now();

  TextStyle textStyle = const TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('Mutemet İşlemlerim'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () async {
              Navigator.pop<bool>(context, false);
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              TextFormField(
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  label: Text('Personel PBİK'),
                  border: OutlineInputBorder(),
                  hintText: 'Mutemet Personel PBİK',
                ),
              ),
              TextButton(
                onPressed: () async {
                  timeForTrustee = await showDatePicker(
                      context: context,
                      initialDate: DateTime(2020),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2024));
                  setState(() {});
                },
                child: const Text('Vekalet Bitiş Tarihi  Seçiniz'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: const Text('Kaydet'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
