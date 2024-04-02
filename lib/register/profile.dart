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
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Image.asset(
                'mdr-logo.png',
                width: 27,
                height: 27,
              ),
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Color.fromARGB(255, 218, 203, 7)],
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selamat Datang', // Teks di luar kotak
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'OpenSans',
                ),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width *
                        0.5, // Atur lebar menjadi 50% dari lebar layar
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelStyle: TextStyle(color: Colors.black),
                        hintText: 'Search',
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color.fromARGB(255, 128, 127, 126),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 218, 203,
                                7), // Mengatur warna bingkai aktif menjadi gold
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 218, 203,
                                7), // Mengatur warna bingkai aktif menjadi gold
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 20.0),
                      ),
                      onSubmitted: (value) {},
                      style: TextStyle(fontSize: 16.0), // Atur ukuran font teks
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                margin: EdgeInsets.all(16.0),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white60, // Warna latar belakang container
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: DataTable(
                          columns: [
                            DataColumn(
                              label: Text(
                                'ID',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Name',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Profession',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                          rows: [
                            DataRow(cells: [
                              DataCell(Text('1')),
                              DataCell(Text('Stephen')),
                              DataCell(Text('Actor')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('5')),
                              DataCell(Text('John')),
                              DataCell(Text('Student')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('10')),
                              DataCell(Text('Harry')),
                              DataCell(Text('Leader')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('15')),
                              DataCell(Text('Peter')),
                              DataCell(Text('Scientist')),
                            ]),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.only(right: 16, bottom: 16),
                child: FloatingActionButton.extended(
                  onPressed: () {
                    // Implementasi fungsi ketika FAB ditekan
                  },
                  label: Text('Buat Jadwal'),
                  icon: Icon(Icons.add),
                  backgroundColor: Colors.white,
                  foregroundColor: Color.fromARGB(255, 218, 203, 7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
