import 'package:flutter/material.dart';
import 'package:flutterku/main.dart';
import 'package:flutterku/register/login_page.dart';

class ProfilePage extends StatefulWidget {
  final String namaLengkap;
  final String email;
  final String alamatLengkap;
  final String username;
  final String tanggalLahir;
  final String gender;
  final String password;

  ProfilePage({
    required this.namaLengkap,
    required this.email,
    required this.alamatLengkap,
    required this.username,
    required this.tanggalLahir,
    required this.gender,
    required this.password,
  });

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool receiveNotifications = true;
  bool isDarkMode = false;
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Image.asset('logoatas.png',
                  width: 27,
                  height: 27), // Ganti 'your_image.png' dengan path gambar Anda
            ),
            Text('Dashboard'),
          ],
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Konfirmasi'),
                    content: Text('Anda yakin ingin logout?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Tutup dialog
                        },
                        child: Text('Batal'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(
                                userData: UserData(
                                  password: widget.password,
                                  namaLengkap: widget.namaLengkap,
                                  email: widget.email,
                                  alamatLengkap: widget.alamatLengkap,
                                  username: widget.username,
                                  tanggalLahir: widget.tanggalLahir,
                                  gender: widget.gender,
                                ), // Menggunakan UserData yang telah diisi
                              ),
                            ),
                            (route) => false,
                          );
                        },
                        child: Text('Logout'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello', // Teks di luar kotak
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            Text(
              '${widget.namaLengkap}', // Teks di luar kotak
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context)
                  .size
                  .width, // Lebar kontainer = lebar layar
              decoration: BoxDecoration(
                color: const Color.fromARGB(
                    255, 66, 66, 66), // Warna latar belakang kotak
                borderRadius:
                    BorderRadius.circular(0), // Mengatur border radius kotak
              ),
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.username}',
                    style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${widget.email}',
                    style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${widget.gender}',
                    style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${widget.tanggalLahir}',
                    style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${widget.alamatLengkap}',
                    style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            CheckboxListTile(
              title: Text('Belajar Dasar Flutter'),
              subtitle: Text('Dart, Widget, http'),
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text('Backend Programing'),
              subtitle: Text('Dart, Node JS, PHP, Java, dll'),
              trailing: Switch(
                value: isDarkMode,
                onChanged: (value) {
                  setState(() {
                    isDarkMode = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
