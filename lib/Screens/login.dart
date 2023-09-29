import 'package:flutter/material.dart';
import 'package:flutter_cashbook/Screens/home.dart';
import 'package:flutter_cashbook/data/user.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 85, 145, 141),
        title: Text('Vinaya`s Cashbook'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Logo Aplikasi
              Image.asset(
                'images/logincashflow.png', // asset image
                width: 80.0, // Sesuaikan ukuran gambar
                height: 80.0,
              ),

              SizedBox(height: 16.0),
              // Nama Aplikasi
              Text(
                'My Cashbook V 1.0',
                style: TextStyle(fontSize: 24.0),
              ),
              SizedBox(height: 16.0),
              // Field untuk Username
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
              SizedBox(height: 16.0),
              // Field untuk Password
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true, // Untuk menyembunyikan karakter password
              ),
              SizedBox(height: 24.0),
              // Tombol Login
              ElevatedButton(
                onPressed: () {
                  // Validasi login di sini
                  if (_usernameController.text == username &&
                      _passwordController.text == password) {
                    // Jika login berhasil, pindah ke halaman "Home"
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  } else {
                    // Jika login gagal, tampilkan pesan kesalahan
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Login Gagal. Coba lagi.'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 85, 145,
                      141), // Atur warna latar belakang sesuai dengan AppBar
                ),
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
