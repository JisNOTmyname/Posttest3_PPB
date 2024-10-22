import 'package:flutter/material.dart';
import 'models/barang.dart';
import 'home.dart';

class EditBarangPage extends StatefulWidget {
  final Barang barang;

  EditBarangPage({required this.barang});

  @override
  _EditBarangPageState createState() => _EditBarangPageState();
}

class _EditBarangPageState extends State<EditBarangPage> {
  late TextEditingController _namaController;
  late TextEditingController _stokController;

  @override
  void initState() {
    super.initState();
    _namaController = TextEditingController(text: widget.barang.nama);
    _stokController = TextEditingController(text: widget.barang.stok.toString());
  }

  void _updateBarang() {
    if (_namaController.text.isEmpty || _stokController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Nama dan stok barang tidak boleh kosong')),
      );
      return;
    }

    int? stok = int.tryParse(_stokController.text);
    if (stok == null || stok < 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Stok harus berupa angka positif')),
      );
      return;
    }

    setState(() {
      widget.barang.nama = _namaController.text;
      widget.barang.stok = stok;

      if (widget.barang.stok == 0) {
        barangList.remove(widget.barang);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Barang telah dihapus karena stok 0')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Barang berhasil diperbarui')),
        );
      }
    });

    Navigator.pop(context);
  }

  void _hapusBarang() {
    setState(() {
      barangList.remove(widget.barang);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Barang berhasil dihapus')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Barang'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: _hapusBarang,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Icon(Icons.edit, size: 100, color: Colors.indigo[600]),
            SizedBox(height: 24),
            TextField(
              controller: _namaController,
              decoration: InputDecoration(
                labelText: 'Nama Barang',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.drive_file_rename_outline),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _stokController,
              decoration: InputDecoration(
                labelText: 'Jumlah Stok',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.confirmation_number),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _updateBarang,
              icon: Icon(Icons.save),
              label: Text('Simpan Perubahan'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: TextStyle(fontSize: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
