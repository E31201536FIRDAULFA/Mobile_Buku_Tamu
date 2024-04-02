import 'package:flutter/material.dart';
import 'package:flutterku/register/login_page.dart';

import '../main.dart';

class PengajuanPage extends StatefulWidget {
  const PengajuanPage({Key? key}) : super(key: key);

  @override
  State<PengajuanPage> createState() => _PengajuanPageState();
}

class _PengajuanPageState extends State<PengajuanPage> {
  bool visibility = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController namaLengkapController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController tanggalLahirController = TextEditingController();
  TextEditingController alamatLengkapController = TextEditingController();
  String? selectedGender;
  final List<String> genderOptions = ['Laki-laki', 'Perempuan'];

  final _formKey = GlobalKey<FormState>(); // Add a global key for the form

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            backgroundColor: Theme.of(context).colorScheme.inverseSurface,
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        tanggalLahirController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Pengajuan"),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Color.fromARGB(
                  255, 218, 203, 7), // Gradient colors: white to gold
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey, // Assign the form key to the Form widget
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: namaLengkapController,
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
                      labelText: "Nama Lengkap",
                      labelStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Color.fromARGB(255, 49, 47, 23),
                      ),
                      hintText: "Masukkan Nama Lengkap",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama Lengkap wajib diisi';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: usernameController,
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
                      labelText: "Username",
                      labelStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: Color.fromARGB(255, 49, 47, 23),
                      ),
                      hintText: "Masukkan Username",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Username wajib diisi';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
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
                        Icons.email,
                        color: Color.fromARGB(255, 49, 47, 23),
                      ),
                      hintText: "Masukkan Email",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email wajib diisi';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
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
                        Icons.lock,
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password wajib diisi';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.datetime,
                    controller: tanggalLahirController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                          color: Colors
                              .black, // Mengatur warna bingkai menjadi gold
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                          color: Colors
                              .black, // Mengatur warna bingkai aktif menjadi gold
                        ),
                      ),
                      labelText: "Tanggal Lahir",
                      labelStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(
                        Icons.calendar_today,
                        color: Color.fromARGB(255, 49, 47, 23),
                      ),
                      hintText: "Pilih Tanggal Lahir",
                    ),
                    readOnly: true, // Prevent keyboard from showing
                    onTap: () => _selectDate(context),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Tanggal Lahir wajib diisi';
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: FormField<String>(
                    builder: (FormFieldState<String> state) {
                      return DropdownButtonFormField<String>(
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
                          labelText: "Jenis Kelamin",
                          labelStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(
                            Icons.wc_outlined,
                            color: Color.fromARGB(255, 49, 47, 23),
                          ),
                        ),
                        value: selectedGender,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedGender = newValue;
                          });
                        },
                        items: genderOptions.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Jenis Kelamin wajib dipilih';
                          }
                          return null;
                        },
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: alamatLengkapController,
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
                      labelText: "Alamat Lengkap",
                      labelStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(
                        Icons.place,
                        color: Color.fromARGB(255, 49, 47, 23),
                      ),
                      hintText: "Masukkan Alamat Lengkap",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Alamat Lengkap wajib diisi';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Only navigate if form is valid
                        UserData userData = UserData(
                          namaLengkap: namaLengkapController.text,
                          username: usernameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          tanggalLahir: tanggalLahirController.text,
                          gender: selectedGender,
                          alamatLengkap: alamatLengkapController.text,
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(userData: userData),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 200.0), // Adjust the padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              40.0), // Adjust the border radius
                        ),
                        primary: Color.fromARGB(255, 255, 255,
                            255) // Mengatur warna tombol menjadi gold
                        ),
                    child: Text(
                      'Ajukan',
                      style: TextStyle(
                        color: Color.fromARGB(255, 218, 203, 7), // Warna gold
                      ),
                    ), // Mengatur warna tombol menjadi gold
                  ),
                ),
                // Add other form fields
                // Don't forget to wrap the whole content in a Container with gradient background
              ],
            ),
          ),
        ),
      ),
    );
  }
}
