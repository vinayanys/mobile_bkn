import 'package:flutter/material.dart';
import 'package:flutter_cashbook/Screens/about.dart';
import 'package:flutter_cashbook/Screens/income.dart';
import 'package:flutter_cashbook/Screens/expense.dart';
import 'package:flutter_cashbook/Screens/cashflow.dart';
import 'package:flutter_cashbook/data/user.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 85, 145, 141),
        title: Align(
          alignment: Alignment.center, // Center-align the content
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Welcome Back',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                '$username',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Label Total Pemasukan
            Text(
              'Pemasukan: Rp 1,000,000', // Ganti dengan jumlah pemasukan aktual
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16.0),

            // Label Total Pengeluaran
            Text(
              'Pengeluaran: Rp 500,000', // Ganti dengan jumlah pengeluaran aktual
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 24.0),

            // Grafik (Opsional)
            // Anda dapat menggunakan library seperti 'fl_chart' untuk membuat grafik
            // atau menggantinya dengan gambar sesuai kebutuhan

            // Tombol Navigasi
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // Tombol Tambah Pemasukan
                ElevatedButton.icon(
                  onPressed: () {
                    // Navigasi ke halaman "Tambah Pemasukan"
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TambahPemasukanPage(),
                      ),
                    );
                  },
                  icon: Icon(Icons.add),
                  label: Text('Tambah Pemasukan'),
                ),

                // Tombol Tambah Pengeluaran
                ElevatedButton.icon(
                  onPressed: () {
                    // Navigasi ke halaman "Tambah Pengeluaran"
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TambahPengeluaran(),
                      ),
                    );
                  },
                  icon: Icon(Icons.add),
                  label: Text('Tambah Pengeluaran'),
                ),
              ],
            ),

            SizedBox(height: 16.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // Tombol Detail Cash Flow
                ElevatedButton.icon(
                  onPressed: () {
                    // Navigasi ke halaman "Detail Cash Flow"
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailCashFlowPage(),
                      ),
                    );
                  },
                  icon: Icon(Icons.list),
                  label: Text('Detail Cash Flow'),
                ),

                // Tombol Pengaturan
                // Tombol untuk Navigasi ke Halaman Pengaturan
                ElevatedButton(
                  onPressed: () {
                    // Navigasi ke Halaman Pengaturan
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingsPage(),
                      ),
                    );
                  },
                  child: Text('Pengaturan'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
