import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rating_film/services/database_service.dart';

CollectionReference tblUser = FirebaseFirestore.instance.collection("users");
CollectionReference tblData =
    FirebaseFirestore.instance.collection("data_film");

class FireStoreService {
  static Future<MyUser> getUser({required String email}) async {
    QuerySnapshot querySnapshot =
        await tblUser.where("email", isEqualTo: email).get();

    if (querySnapshot.docs.isNotEmpty) {
      DocumentSnapshot docSnapshot = querySnapshot.docs.first;
      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
      return MyUser.fromJson(data); // Sesuaikan dengan model data pengguna Anda
    } else {
      throw Exception("Data dengan email $email tidak ditemukan");
    }
  }

  static Stream<QuerySnapshot> getData(String jenisUpload) {
    return tblData.where('upload', isEqualTo: jenisUpload).snapshots();
  }

  static Stream<QuerySnapshot> getByGenre(String genre) {
    return tblData.where('genre', isEqualTo: genre).snapshots();
  }

  static Future<void> tambahUser({required MyUser user}) async {
    DocumentReference docref = tblUser.doc();
    await docref
        .set(user.toJson())
        .whenComplete(() => "Pengguna berhasil ditambahkan")
        .catchError((e) => print(e));
  }
}
