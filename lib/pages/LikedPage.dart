// ignore_for_file: use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:metasphere/home.dart';
// ignore: unused_import
import 'package:smetasphere/pages/home_page.dart';
//import 'package:rough_code/main.dart';

// class LikedPage extends StatefulWidget {
//   const LikedPage({Key? key}) : super(key: key);

//   @override
//   _LikedPageState createState() => _LikedPageState();
// }

// class _LikedPageState extends State<LikedPage> {
//   final FirestoreService _firestoreService = FirestoreService();
//   List<Map<String, dynamic>> likedPosts = [];

//   @override
//   void initState() {
//     super.initState();
//     _loadLikedPosts();
//   }

//   Future<void> _loadLikedPosts() async {
//     final posts = await _firestoreService.fetchLikedPosts();
//     setState(() {
//       likedPosts = posts;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Liked Posts')),
//       body: likedPosts.isEmpty
          


// ? const Center(child: Text('No Liked posts yet.'))
//           : ListView.builder(
//               itemCount: likedPosts.length,
//               itemBuilder: (context, index) {
//                 final post = likedPosts[index];
//                 return Card(
//                   margin: const EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           post['Company Name'],
//                           style: const TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       Image.asset(
//                         post['Image'],
//                         fit: BoxFit.cover,
//                         width: double.infinity,
//                         height: 250,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           post['Description'],
//                           style: const TextStyle(fontSize: 14),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }
class LikedPage extends StatelessWidget {
  const LikedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      return const Center(
        child: Text("Please log in to view liked posts."),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Liked Posts"),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection('users').doc(currentUser.uid).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text("No liked posts found."));
          }

          final userDoc = snapshot.data!;
          final likedPosts = List<Map<String, dynamic>>.from(userDoc['likedPosts'] ?? []);

          if (likedPosts.isEmpty) {
            return const Center(child: Text("No liked posts yet."));
          }

          return ListView.builder(
            itemCount: likedPosts.length,
            itemBuilder: (context, index) {
              final post = likedPosts[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        post['companyName'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Image.asset(
                      post['image'],
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 200,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(post['description']),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

