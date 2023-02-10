import 'package:flutter/material.dart';
import 'detailwidget.dart';
import 'models/tenis.dart';

class TenisList extends StatelessWidget {
  final List<Tenis> tenis;
  TenisList({super.key, required this.tenis});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tenis == null ? 0 : tenis.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailWidget(tenis[index])),
              );
            },
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text(tenis[index].modelo),
              subtitle: Text(tenis[index].tamanho.toString()),
            ),
          ));
        });
  }
}
