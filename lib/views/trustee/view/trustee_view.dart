import 'package:flutter/material.dart';

class TrusteeView extends StatelessWidget {
  TrusteeView({super.key});

  TextStyle textStyle = const TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Column(
          children: <DataTable>[
            DataTable(
              columns: <DataColumn>[
                DataColumn(label: Text('Mutemet Personel Pbik', style: textStyle)),
                DataColumn(label: Text('Vekalet Bitiş Tarihi', style: textStyle))
              ],
              rows: [
                DataRow(cells: <DataCell>[
                  const DataCell(
                    TextField(
                      decoration: InputDecoration(hintText: 'Mutemet Pbik'),
                    ),
                  ),
                  DataCell(Text('DateTime gelecek', style: textStyle))
                ])
              ],
            )
          ],
        ),
      ),
    );
  }
}
