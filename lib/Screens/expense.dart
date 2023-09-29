import 'package:flutter/material.dart';
import 'package:flutter_cashbook/Screens/home.dart'; // Ganti dengan import yang sesuai
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TambahPengeluaran extends StatefulWidget {
  @override
  _TambahPengeluaranState createState() => _TambahPengeluaranState();
}

class _TambahPengeluaranState extends State<TambahPengeluaran> {
  TextEditingController _jumlahController = TextEditingController();
  TextEditingController _keteranganController = TextEditingController();
  DateTime? _selectedDate; // Declare _selectedDate as nullable

  @override
  void initState() {
    super.initState();
    _selectedDate =
        DateTime.now(); // Initialize _selectedDate with the current date
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate!,
      firstDate: DateTime(2021),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _resetForm() {
    setState(() {
      _selectedDate = DateTime(2021, 1, 1); // Reset date to 01/01/2021
      _jumlahController.clear();
      _keteranganController.clear();
    });
  }

  void _simpanData() {
    // Simpan data pemasukan ke database SQLite (implementasi tidak disertakan)
    // Anda perlu menggantinya dengan kode yang sesuai dengan database Anda

    // Setelah data disimpan, kembali ke halaman Beranda
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 85, 145, 141),
        title: Text('Tambah Pemasukan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Field untuk memilih tanggal
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Tanggal:',
                  style: TextStyle(fontSize: 18),
                ),
                TextButton(
                  onPressed: () => _selectDate(context), // Pass context here
                  child: Text(
                    _selectedDate != null
                        ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                        : 'Pilih Tanggal',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),

            // Field untuk memasukkan jumlah (nominal) uang
            TextFormField(
              controller: _jumlahController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Jumlah (Rp)'),
            ),
            SizedBox(height: 16.0),

            // Field untuk memasukkan keterangan
            TextFormField(
              controller: _keteranganController,
              decoration: InputDecoration(labelText: 'Keterangan'),
            ),
            SizedBox(height: 24.0),

            // Tombol Reset
            SizedBox(
              width: double.infinity, // Makes the button take the full width
              child: ElevatedButton(
                onPressed: _resetForm,
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // Atur warna latar belakang
                ),
                child: Text('Reset'),
              ),
            ),
            SizedBox(height: 16.0), // Add vertical spacing

// Tombol Simpan
            SizedBox(
              width: double.infinity, // Makes the button take the full width
              child: ElevatedButton(
                onPressed: _simpanData,
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(
                      255, 85, 145, 141), // Atur warna latar belakang
                ),
                child: Text('Simpan'),
              ),
            ),
            SizedBox(height: 16.0), // Add vertical spacing

// Tombol Kembali
            SizedBox(
              width: double.infinity, // Makes the button take the full width
              child: ElevatedButton(
                onPressed: () {
                  // Kembali ke halaman Beranda
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey, // Atur warna latar belakang
                ),
                child: Text('<< Kembali'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
