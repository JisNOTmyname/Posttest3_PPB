import 'package:flutter/material.dart';
import 'models/barang.dart';
import 'edit_barang.dart';
import 'home.dart';

class LihatBarangPage extends StatefulWidget {
  @override
  _LihatBarangPageState createState() => _LihatBarangPageState();
}

class _LihatBarangPageState extends State<LihatBarangPage> {
  @override
  Widget build(BuildContext context) {
    if (barangList.isEmpty) {
      return Center(
        child: Text(
          'Belum ada barang.\nSilakan tambahkan barang.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.indigo[700]),
        ),
      );
    }

    return ListView.builder(
      itemCount: barangList.length,
      itemBuilder: (context, index) {
        Barang barang = barangList[index];

        return Card(
          elevation: 4,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            leading: Icon(Icons.inventory_2, color: Colors.indigo[600]),
            title: Text(
              barang.nama,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Stok: ${barang.stok}'),
            trailing: Icon(Icons.edit, color: Colors.indigo[600]),
            onTap: () async {
              // Navigate to edit page and refresh after returning
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditBarangPage(barang: barang),
                ),
              );
              setState(() {});
            },
          ),
        );
      },
    );
  }
}
