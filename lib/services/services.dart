// import 'package:dio/dio.dart';
// import 'package:prak_mobile/praktikum6/models/user.dart';

// class APIservices {
//   static Future <List<User>> fetchUser() async {
//     Response response = await Dio().get("https://reqres.in/api/users");
//     List<User> users = 
//         (response.data['data'] as List).map((v) => User.fromJson(v)).toList();
//     return users;
//   }
// }


// // class APIServices {
// //   static Dio _dio = Dio(); // Create a Dio instance

// //   static Future<List<User>> getUsers() async {
// //     try {
// //       final response = await _dio.get('https://reqres.in/api/users?page=2');

// //       if (response.statusCode == 200) {
// //         final data = response.data['data'] as List<dynamic>;
// //         final users = data.map((userData) => User.fromJson(userData)).toList();
// //         return users;
// //       } else {
// //         throw Exception('Failed to load users: ${response.statusCode}');
// //       }
// //     } catch (e) {
// //       throw Exception('Failed to load users: $e');
// //     }
// //   }
// // }