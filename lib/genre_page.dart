import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rating_film/desc_page.dart';
import 'package:rating_film/models/data.dart';
import 'package:rating_film/services/firestore_service.dart';

class CategoryPage extends StatefulWidget {
  final String genre;
  final List<DataAnime> dataForGenre; // Add this parameter

  const CategoryPage(
      {Key? key, required this.genre, required this.dataForGenre})
      : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.genre,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        iconTheme: IconThemeData(color: Theme.of(context).primaryColorLight),
        backgroundColor: Color.fromARGB(255, 115, 11, 11), // Tampilkan nama kategori di app bar
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FireStoreService.getByGenre(widget.genre),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Or any other loading indicator
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Text('No data available');
          }

          List<DocumentSnapshot> data = snapshot.data!.docs;

          return ListView.builder(
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(height: 15),
                                  Text(
                                    document['name'],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Container(
                                    width: 150,
                                    child: Text(
                                      document['genre'],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  RatingBar.builder(
                                    initialRating: 5,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    itemCount: 5,
                                    itemSize: 18,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 4),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Color.fromARGB(255, 255, 123, 0),
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
    );
  }
}
