import 'package:flutter/material.dart';
import 'package:flutter_cashbook/Screens/login.dart';
import 'package:flutter_cashbook/data/user.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController _currentPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  bool _passwordChanged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 85, 145, 141),
        title: Text('Pengaturan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Input untuk Password Saat Ini
            TextFormField(
              controller: _currentPasswordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password Saat Ini'),
            ),
            SizedBox(height: 16.0),

            // Input untuk Password Baru
            TextFormField(
              controller: _newPasswordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password Baru'),
            ),
            SizedBox(height: 16.0),

            // Tombol untuk Menyimpan Password Baru
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0), // Add bottom spacing
              child: ElevatedButton(
                onPressed: () {
                  // Validasi password saat ini
                  if (_currentPasswordController.text == password) {
                    // Jika password saat ini benar, simpan password baru
                    _passwordChanged = true;
                    password = _newPasswordController.text;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Password berhasil diubah.'),
                      ),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  } else {
                    // Jika password saat ini salah, tampilkan pesan kesalahan
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Password saat ini salah. Coba lagi.'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 85, 145,
                      141), // Atur warna latar belakang sesuai dengan AppBar
                ),
                child: Text('Simpan Password Baru'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0), // Add bottom spacing
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
                child: Text('<< Kembali'),
              ),
            ),

            // Jarak antara Tombol dan Informasi Developer
            SizedBox(height: 32.0),

            // Baris untuk menampilkan gambar dan informasi developer
            Row(
              children: <Widget>[
                // Gambar Developer (rasio 3:4)
                Container(
                  width: 120.0,
                  height: 160.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'images/Tifa.jpg'), // Ganti dengan path gambar Anda
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 16.0), // Spasi antara gambar dan teks

                // Teks Nama dan NIM
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'About this App..',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0), // Jarak antara teks
                    Text('Aplikasi Ini Dibuat Oleh:'),
                    Text('Nama: Vinaya Ainunissa'),
                    Text('NIM: 1234567890'),
                    Text('Tanggal: 29 September 2023'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
