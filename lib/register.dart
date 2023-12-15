import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rating_film/login.dart';
import 'package:rating_film/services/database_service.dart';
import 'package:rating_film/services/firebase_auth_service.dart';
import 'package:rating_film/services/firestore_service.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _notlpController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuthService _authService = FirebaseAuthService();

  @override
  void dispose() {
    _fullnameController.dispose();
    _notlpController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void register() async {
    String fullname = _fullnameController.text;
    String notlp = _notlpController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user =
        await _authService.signUpWithEmailandPassword(email, password, context);

    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "User Berhasil Dibuat",
          ),
          backgroundColor: Colors.green,
        ),
      );

      final myUser = MyUser(
        // Menggunakan nama kelas MyUser yang telah diganti
        fullname: fullname,
        email: email, // Alamat email pengguna
        notlp: notlp,
      );

      await FireStoreService.tambahUser(user: myUser); // Menggunakan MyUser

      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Tidak Dapat Membuat User"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 99, 95, 95),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Daftar",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _fullnameController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.account_box_rounded),
                hintText: "Nama Lengkap",
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _notlpController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.ad_units_rounded),
                hintText: "No Telepon",
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email),
                hintText: "Alamat Email",
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.key),
                hintText: "Password",
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              height: 55,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 115, 11, 11),
                ),
                onPressed: () {
                  register();
                },
                child: const Text(
                  "Daftar",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Sudah Punya Akun?",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 8.0),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
