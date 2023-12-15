// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:review_anime/services/firestore_service.dart';

// class HomeUser extends StatefulWidget {
//   const HomeUser({super.key});

//   @override
//   State<HomeUser> createState() => _HomeUserState();
// }

// class _HomeUserState extends State<HomeUser> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 11, 53, 115),
//         elevation: 0,
//         iconTheme: IconThemeData(color: Theme.of(context).primaryColorLight),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(
//                 height: 40,
//               ),
//               const Text(
//                 "Profil",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               StreamBuilder<QuerySnapshot>(
//                 stream: FireStoreService().getUsers(), 
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return const Center(child: CircularProgressIndicator());
//                   }
//                   else
//                   {
//                     if (snapshot.hasError) {
//                       return Text(snapshot.error.toString());
//                     }
//                     else
//                     {
//                       List userList = snapshot.data!.docs;
//                       return SizedBox(
//                         width: double.infinity,
//                         child: ListView.builder(
//                           shrinkWrap: true,
//                           padding: const EdgeInsets.symmetric(vertical: 15),
//                           physics: const NeverScrollableScrollPhysics(),
//                           itemCount: userList.length,
//                           itemBuilder: (context, index) {
//                             DocumentSnapshot documentSnapshot = userList[index];

//                             Map<String, dynamic> data = 
//                                 documentSnapshot.data() as Map<String, dynamic>;
                            
//                             return Container(
//                               margin: const EdgeInsets.symmetric(vertical: 5),
//                               child: Material(
//                                 color: Colors.purple[50],
//                                 elevation: 2,
//                                 borderRadius: BorderRadius.circular(5),
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(12.0),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text(data['fullname']),
//                                       Text(data['username']),
//                                       Text(data['email'])
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       );
//                     }
//                   }
//                 }
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }