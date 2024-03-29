import 'package:flutterku/register/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutterku/register/register_page.dart';
import 'package:flutterku/main.dart';

class LoginPage extends StatefulWidget {
  final UserData userData;

  const LoginPage({Key? key, required this.userData}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool visibility = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String password = widget.userData.password ?? '';
    String email = widget.userData.email ?? '';
    String namaLengkap = widget.userData.namaLengkap ?? '';
    String alamatLengkap = widget.userData.alamatLengkap ?? '';
    String username = widget.userData.username ?? '';
    String tanggalLahir = widget.userData.tanggalLahir ?? '';
    String gender = widget.userData.gender ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text("Buku Tamuku"),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20), // Jarak atas
          Image.asset(
            'logomdr.jpeg',
            // Ganti dengan path gambar Anda
            height: 250, // Sesuaikan dengan tinggi gambar
            width: 250, // Sesuaikan dengan lebar gambar
            fit: BoxFit.contain,
          ),
          SizedBox(height: 5),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              autofocus: true,
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 218, 203,
                        7), // Mengatur warna bingkai menjadi gold
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 218, 203,
                        7), // Mengatur warna bingkai aktif menjadi gold
                  ),
                ),
                labelText: "Email",
                labelStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(
                  Icons.email_rounded,
                  color: Color.fromARGB(255, 49, 47, 23),
                ),
                hintText: "Masukkan Email",
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10.0),
            child: TextField(
              autofocus: true,
              controller: passwordController,
              obscureText: visibility,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 218, 203,
                        7), // Mengatur warna bingkai menjadi gold
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 218, 203,
                        7), // Mengatur warna bingkai aktif menjadi gold
                  ),
                ),
                labelText: "Password",
                labelStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(
                  Icons.key,
                  color: Color.fromARGB(255, 49, 47, 23),
                ),
                hintText: "Masukkan Password",
                suffixIcon: IconButton(
                  color: Color.fromARGB(255, 49, 47, 23),
                  icon: visibility
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      visibility = !visibility;
                    });
                  },
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                if (emailController.text == email &&
                    passwordController.text == password) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Login berhasil'),
                      duration: Duration(seconds: 2), // Durasi snackbar
                    ),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(
                        namaLengkap: namaLengkap,
                        email: email,
                        alamatLengkap: alamatLengkap,
                        username: username,
                        tanggalLahir: tanggalLahir,
                        gender: gender,
                        password: password,
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Email atau password tidak valid'),
                    ),
                  );
                  emailController.clear();
                  passwordController
                      .clear(); // Kosongkan kolom email dan password jika salah
                }
              },
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 200.0), // Adjust the padding
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(40.0), // Adjust the border radius
                  ),
                  primary: Color.fromARGB(
                      255, 218, 203, 7) // Mengatur warna tombol menjadi gold
                  ),
              child: Text('Login'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Belum mempunyai akun? "),
                TextButton(
                  onPressed: () {
                    Route route = MaterialPageRoute(
                      builder: (context) => RegisterPage(),
                    );
                    Navigator.push(context, route);
                  },
                  child: Text(
                    "Register",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 218, 203, 7),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
