import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rating_film/genre_page.dart';
import 'package:rating_film/desc_page.dart';
import 'package:rating_film/models/data.dart';
import 'package:rating_film/services/firestore_service.dart';
import 'package:rating_film/user.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<DataAnime> data = data_user
      .map((e) => DataAnime.fromJson(e))
      .toList(); // Inisialisasi data produk dari data_user
  List<DataAnime> data2 = data_user2.map((e) => DataAnime.fromJson(e)).toList();
  List<DataAnime> dataAksi =
      data_Aksi.map((e) => DataAnime.fromJson(e)).toList();
  List<DataAnime> dataFantasi =
      data_Fantasi.map((e) => DataAnime.fromJson(e)).toList();
  List<DataAnime> dataPetualangan =
      data_Petualangan.map((e) => DataAnime.fromJson(e)).toList();
  List<DataAnime> dataKomedi =
      data_Komedi.map((e) => DataAnime.fromJson(e)).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[800],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
              color: Color.fromARGB(255, 115, 11, 11),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Selamat Datang",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // CircleAvatar(
                      //   backgroundImage: NetworkImage(
                      //     "https://i.pinimg.com/564x/d3/0e/0f/d30e0f6bab82c3937c90c1485f0c0942.jpg",
                      //   ),
                      //   radius: 30,
                      // ),
                    ],
                  ),
                  SizedBox(height: 12.0),
                  const Text(
                    "Mau nonton apa hari ini??",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            Container(
              child: Stack(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search_outlined,
                        color: Color.fromARGB(255, 255, 68, 68),
                      ),
                      hintText: "Cari judul film?",
                      border: InputBorder.none,
                    ),
                  ),
                  Positioned(
                    bottom: 6,
                    right: 12,
                    child: Container(
                      child: const Icon(
                        Icons.mic_none_outlined,
                        color: Color.fromARGB(255, 255, 68, 68),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Divider(
              color: Colors.black,
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Genre",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: [
                    //Single Item
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        width: 120, // Lebar kotak
                        height: 50, // Tinggi kotak
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 132, 0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: Offset(0, 3)),
                          ],
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CategoryPage(
                                        genre: "Petualangan",
                                        dataForGenre: dataPetualangan)));
                          },
                          child: Text(
                            "Petualangan", // Nama kategori
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold,
                              fontSize: 15, // Warna teks
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        width: 100, // Lebar kotak
                        height: 50, // Tinggi kotak
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 0, 0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: Offset(0, 3)),
                          ],
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CategoryPage(
                                        genre: "Aksi",
                                        dataForGenre: dataAksi)));
                          },
                          child: Text(
                            "Aksi", // Nama kategori
                            style: TextStyle(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold,
                              fontSize: 15, // Warna teks
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        width: 110, // Lebar kotak
                        height: 50, // Tinggi kotak
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 17, 253, 0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: Offset(0, 3)),
                          ],
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CategoryPage(
                                        genre: "Komedi",
                                        dataForGenre: dataKomedi)));
                          },
                          child: Text(
                            "Komedi", // Nama kategori
                            style: TextStyle(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold,
                              fontSize: 15, // Warna teks
                            ),
                          ),
                        ),
                      ),
                    ),
                    
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        width: 100, // Lebar kotak
                        height: 50, // Tinggi kotak
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 0, 34, 255),
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: Offset(0, 3)),
                          ],
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CategoryPage(
                                        genre: "Fantasi",
                                        dataForGenre: dataFantasi)));
                            // Fungsi yang akan dijalankan ketika tombol ditekan
                          },
                          child: Text(
                            "Fantasi", // Nama kategori
                            style: TextStyle(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold,
                              fontSize: 15, // Warna teks
                            ),
                          ),
                        ),
                      ),
                    ),
                    
                    
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Paling Banyak Ditonton",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // TextButton(
                  //   child: Text(
                  //     "View All",
                  //   ),
                  //   onPressed: () {},
                  // ),
                ],
              ),
            ),
            Container(
              height: 200,
              child: StreamBuilder<QuerySnapshot>(
                stream: FireStoreService.getData("Most View"),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(); // Or any other loading indicator
                  }

                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Text('Data Tidak Tersedia');
                  }

                  List<DocumentSnapshot> data = snapshot.data!.docs;

                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      var document = data[index].data() as Map<String, dynamic>;

                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DescPage(
                                image: document['avatar'],
                                name: document['name'],
                                genre: document['genre'],
                                describe: document['describe'],
                              ),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 10,
                          color: Color.fromARGB(255, 233, 208, 208),
                          child: Container(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Image.network(
                                  document['avatar'],
                                  width: 100,
                                  height: 120,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  document['name'],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Film Terbaru",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // TextButton(
                  //   child: Text("View All"),
                  //   onPressed: () {},
                  // ),
                ],
              ),
            ),
            Container(
              height: 910,
              child: StreamBuilder<QuerySnapshot>(
                stream: FireStoreService.getData("latest"),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(); // Or any other loading indicator
                  }

                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Text('Data Tidak Tersedia');
                  }

                  List<DocumentSnapshot> data = snapshot.data!.docs;

                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      var document = data[index].data() as Map<String, dynamic>;

                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DescPage(
                                image: document['avatar'],
                                name: document['name'],
                                genre: document['genre'],
                                describe: document['describe'],
                              ),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 10,
                          color: const Color.fromARGB(255, 233, 208, 208),
                          child: Row(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 5),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Image.network(
                                          document['avatar'],
                                          width: 150,
                                          height: 150,
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      height: 150,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(height: 15),
                                          Text(
                                            document['name'],
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Container(
                                            width: 150,
                                            child: Text(document['genre']),
                                          ),
                                          SizedBox(height: 10),
                                          RatingBar.builder(
                                            initialRating: 5,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            itemCount: 5,
                                            itemSize: 18,
                                            itemPadding: EdgeInsets.symmetric(
                                                horizontal: 4),
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Color.fromARGB(255, 239, 152, 0),
                                            ),
                                            onRatingUpdate: (index) {},
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
