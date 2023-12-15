import 'package:flutter/material.dart';
import 'package:rating_film/login.dart';
// import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 11, 53, 115),
      body: Stack(
        children: [
          backgroundImage(),
          Container(
            width: 1920,
            height: 1080,
            color: Color(0xFF131429).withOpacity(0.77),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  RichText(
                    text: const TextSpan(
                      text: 'MOVIE\t',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Bebas",
                          fontSize: 30,
                          letterSpacing: 5),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'REVIEW',
                          style: TextStyle(color: Color.fromARGB(255, 255, 0, 0)),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Selamat Datang",
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 17),
                        Text(
                          "Eksplore Film Terbaru Yang Anda Inginkan!",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.transparent,
                        border: Border.all(width: 2, color: Colors.white),
                      ),
                      height: 50,
                      width: 500 * 0.7,
                      child: const Center(
                        child: Text(
                          "MASUK",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 27),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container backgroundImage() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://i.pinimg.com/564x/3a/7b/1a/3a7b1a51eef2db572083de07d96adc09.jpg'),
          // image: AssetImage('assets/images/9.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: SplashScreen(),
//     theme: ThemeData(
//       primarySwatch: Colors.blue, // Ganti dengan warna tema utama Anda
//     ),
//   ));
// }